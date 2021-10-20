<?php

use Illuminate\Support\Facades\Route;


use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\TimesheetController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\AssignProjectController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

/* Department */

Route::group(['prefix'=>'/admin/department'],function () {

    Route::get('/',[DepartmentController::class,'index'])->name('department');

    Route::post('/',[DepartmentController::class,'store'])->name('department.store');
    
    Route::get('/delete/{id}',[DepartmentController::class,'delete'])->name('department.delete');

});

/* Employee */

Route::group(['prefix'=>'/admin/employee'],function () {

    Route::get('/', [EmployeeController::class,'index'])->name('employee');
    
    Route::get('/{fname}',[EmployeeController::class,'showByFirstName'])->name('employee.showbyfirstname');

    Route::post('/',[EmployeeController::class,'store'])->name('employee.store');

    Route::post('/edit',[EmployeeController::class,'edit'])->name('employee.edit');

    Route::post('/update',[EmployeeController::class,'update'])->name('employee.update');
    
    Route::get('/delete/{id}',[EmployeeController::class,'delete'])->name('employee.delete');
    
});

/* project */

Route::group(['prefix'=>'/admin/project'],function () {

    Route::get('/',[ProjectController::class,'index'])->name('project');
        
    Route::post('/',[ProjectController::class,'store'])->name('project.store');

    Route::get('/delete/{id}',[ProjectController::class,'delete'])->name('project.delete');
});

/* assign project */


Route::group(['prefix'=>'/admin/assignproject'],function () {

    Route::get('/',[AssignProjectController::class,'index'])->name('assignproject');

    Route::post('/',[AssignProjectController::class,'store'])->name('assignproject.store'); 

    Route::get('/delete/{id}',[AssignProjectController::class,'delete'])->name('assignproject.delete');
});

/* task */

Route::group(['prefix'=>'/admin/task'],function () {

    Route::get('/',[TaskController::class,'index'])->name('task');

    Route::post('/',[TaskController::class,'store'])->name('task.store');

});

/* timesheet */


Route::group(['prefix'=>'/admin/timesheet'],function () {

    Route::get('/timesheet',[TimesheetController::class,'index'])->name('timesheet');

    Route::post('/',[TimesheetController::class,'store'])->name('timesheet.store');
            
    Route::get('/edit',[TimesheetController::class,'edit'])->name('timesheet.edit');

    Route::post('/showtask',[TimesheetController::class,'showTask'])->name('timesheet.showtask');

    Route::post('/showdescription',[TimesheetController::class,'showDescription'])->name('timesheet.showdescription');
        
    Route::post('/showbydate',[TimesheetController::class,'showByDate'])->name('timesheet.showbydate');

    Route::post('/showbytoday',[TimesheetController::class,'showByToday'])->name('timesheet.showbytoday');

    Route::post('/update/{id}',[TimesheetController::class,'update'])->name('timesheet.update');

    Route::get('/delete/{id}',[TimesheetController::class,'delete'])->name('timesheet.delete');

});
    /*Employee Attendence */

    Route::group(['prefix'=>'/admin/attendance'],function () {

        Route::get('/', [AttendanceController::class,'index'])->name('attendance');
    
        Route::post('/status',[AttendanceController::class,'showStatus'])->name('attendance.showstatus');
    
        Route::post('/',[AttendanceController::class,'store'])->name('attendance.store');
    });
    
        /* Report */
    
    Route::group(['prefix'=>'/admin/report'],function () {
    
        Route::get('/',[AttendanceController::class,'report'])->name('report');
        
        Route::get('/{id}',[AttendanceController::class,'show'])->name('report.show');
        
        Route::post('/',[AttendanceController::class,'showByData'])->name('report.showbydata');
        
        Route::post('/today',[AttendanceController::class,'showTodayReport'])->name('report.showtoday');
        
        Route::post('/yesterday',[AttendanceController::class,'showYesterdayReport'])->name('report.showyesterday');
    
        Route::post('/lastweek',[AttendanceController::class,'showLastweekReport'])->name('report.showlastweek');
    
        Route::post('/calculate/salary',[AttendanceController::class,'calculateSalary'])->name('report.calculatesalary');
    });

/*voyager*/
Route::group(['prefix' => 'admin'], function () {
    
    Voyager::routes();

});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::get('/posts', [App\Http\Controllers\HomeController::class, 'posts'])->name('posts');

Route::get('/post/{id}', [App\Http\Controllers\HomeController::class, 'post'])->name('post');