<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'emp_id',
        'fname',
        'lname',
        'phone',
        'email',
        'gender',
        'address',
        'salary',
        'dep_id',
    ];

    /**
     * Get the department that the employee belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function depart()
    {
        return $this->belongsTo(Department::class,'dep_id','dep_id');
    }

    /**
     * Set the user's first name.
     *
     * @param  string  $value
     * @return void
     */
    public function setlnameAttribute($value)
    {
        $this->attributes['lname'] = strtolower($value);
    }
    /**
     * Get the user's first name.
     *
     * @param  string  $value
     * @return string
     */
    public function getFullNameAttribute()       
    {        
        return $this->fname.$this->lname;         
    }
}




