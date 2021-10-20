<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\RelationNotFoundException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Log;
use App\Exceptions\EmployeeNotFoundException;

use App\Models\User;
use App\Models\Attendance;
use App\Models\Employee;


use Carbon\Carbon;

class AttendanceController extends Controller
{
    /**
     * Display employee attendance Data.
     *
     * @return redirect to attendance page.
     */
    public function index()
    {
        $attendance = Attendance::with('employeeid')
                                ->orderBy('att_date','Asc')
                                ->paginate(10);

        $employee = Employee::all();
        return view('attendance.attendance',compact('attendance','employee'));
    }
    
    /**
     * Get Employee status by date and employee id using ajax.
     *
     * @param $request for requesting data from ajax.
     * 
     * @return response.
     */
    public function showStatus(Request $request)
    {
        $date = $request->date;
        $employeeId = $request->employeeId;
        $attendance = Attendance::where('employee_id',$employeeId)
                                ->where('att_date',$date)
                                ->orderBy('id', 'DESC')
                                ->first();

        return Response()->json($attendance);
    }

    /**
     * Insert Employee Attendance in attendence table.
     *
     * @param $request for requesting data from form.
     * 
     * @return redirect to attendance page.
     */
    public function store(Request $request)
    {
        $attendance = new Attendance();
        $date = $request->datepicker;
        $employeeId = $request->employeeId;
        if($request->status == 'present'){
            $status=1;  
        } 
        elseif ($request->status == 'absent'){
            $status=0; 
        }   
        $attendanceById = Attendance::where('employee_id',$employeeId)
                            ->where('att_date',$date)
                            ->orderBy('id', 'DESC')
                            ->first();
        
        if($attendanceById)
        {
            $attendanceById->employee_id = $employeeId;
            $attendanceById->att_date = $date;
            $attendanceById->att_status = $status;
            $attendanceById->updated_at = Carbon::now();
            $attendanceById->save();
            session()->flash('message', 'Attendance Updated successfull!.');
            return redirect(route( 'attendance' )); 
        }
        else
        {
            $attendance->employee_id = $employeeId;
            $attendance->att_date = $date;
            $attendance->att_status = $status;
            $attendance->save();
            session()->flash('message', 'Attendance added successfull!.');
            return redirect(route( 'attendance' ));   
        }
    }
    
    /**
     * Display report of all Employee from Database.
     *
     * @return redirect to report page.
     */
    public function report()
    {
        $attendance = Attendance::with('employeeid')->paginate(10);
        $employee = Employee::all();
        return view('attendance.report',compact('attendance','employee'));
    }

    /**
     * Display employee attendence data using id.
     *
     * @param $id.
     * 
     * @return redirect to attendance page.
     */
    public function show($id)
    {
        $attendance = Attendance::with('employeeid')
                                ->where('employee_id',$id)
                                ->get();

        return view('attendance.report_by_id',compact('attendance'));
    }

    /**
     * Get Employee Report value by fromdate, todate and employeeid using ajax.
     *
     * @param $request for requesting data from ajax.
     * 
     * @return response.
     */
    public function showByData(Request $request)
    {
        $startDate = $request->startDate;
        $endDate = $request->endDate;
        $employeeId = $request->employeeId;
        $attendance = Attendance::with('employeeid')
                                ->where('employee_id',$employeeId)
                                ->whereBetween('att_date', [$startDate, $endDate])
                                ->get();

        return Response()->json($attendance);
    }

    /**
     * Get today employee attendance data using ajax.
     *
     * @param $request for requesting data from ajax.
     * 
     * @return response.
     */
    public function showTodayReport(Request $request)
    {
        $date=Carbon::Today();
        $employeeId = $request->employeeId;
        if($employeeId == ''){
            
            $attendance=Attendance::with('employeeid')
                                    ->where('att_date',$date)
                                    ->get();
        }
        else{
            
            $attendance=Attendance::with('employeeid')
                                    ->where('employee_id',$employeeId)
                                    ->where('att_date',$date)
                                    ->get();
        }
        return Response()->json($attendance);
    }

    /**
     * Get yesterday employee attendance data using ajax.
     *
     * @param $request for requesting data from ajax.
     * 
     * @return response.
     */
    public function showYesterdayReport(Request $request)
    {
        $date=Carbon::Yesterday();
        $employeeId = $request->employeeId;
        if($employeeId == ''){
            
            $attendance = Attendance::with('employeeid')
                                    ->where('att_date',$date)
                                    ->get();
        }
        else{
            
            $attendance = Attendance::with('employeeid')
                                    ->where('employee_id',$employeeId)
                                    ->where('att_date',$date)
                                    ->get();
        }
        return Response()->json($attendance);
    }

    /**
     * Get lastweek employee attendance data using ajax.
     *
     * @param $request for requesting data from ajax.
     * 
     * @return response.
     */
    public function showLastweekReport(Request $request)
    {
        $startOfWeek = Carbon::now()->startOfWeek(); 
        $endOfWeek = Carbon::now()->endOfWeek(); 
        $employeeId = $request->employeeId;
        if($employeeId == ''){
           
            $attendance = Attendance::with('employeeid')
                                    ->whereBetween('att_date', [$startOfWeek, $endOfWeek])
                                    ->get();
        }
        else
        {
           
            $attendance = Attendance::with('employeeid')
                                    ->where('employee_id',$employeeId)
                                    ->whereBetween('att_date', [$startOfWeek, $endOfWeek])
                                    ->get();
        }
        return Response()->json($attendance);
    }

    /**
     * Get employee salary using ajax.
     * 
     * @param $request for requesting data from ajax.
     * 
     * @return response.
     */
    public function calculateSalary(Request $request)
    {
        $startDate = $request->startDate;
        $endDate = $request->endDate;
        $employeeId = $request->employeeId;
        $salary = $request->employeeSalary;
        $present = Attendance::where('employee_id',$employeeId)
                                ->whereBetween('att_date', [$startDate, $endDate])
                                ->where('att_status',1)
                                ->count();

        $absent = Attendance::where('employee_id',$employeeId)
                                ->whereBetween('att_date', [$startDate, $endDate])
                                ->where('att_status',0)
                                ->count();

        $totalSalary = $present * $salary;
        if($employeeData = Employee::where('id',$employeeId)->first()){
            $employee = $employeeData;
        }
        else{
            $employee = [];
        }
        return Response()->json(['data'=>['salary'=>$totalSalary,'presentdays'=>$present,'absentdays'=>$absent,'employee'=>$employee]]);
    }

}
