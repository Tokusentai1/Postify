<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Filament\Models\Contracts\FilamentUser;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Notifications\Notifiable;
use Spatie\Activitylog\LogOptions;
use Laravel\Sanctum\HasApiTokens;
use Filament\Panel;

class User extends Authenticatable implements MustVerifyEmail, FilamentUser
{
    use HasApiTokens, HasFactory, Notifiable, LogsActivity;

    protected $fillable = [
        'name',
        'email',
        'password',
        'gender',
        'is_admin',
    ];

    protected $hidden = [
        'password',
        'remember_token',
        'created_at',
        'updated_at',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->is_admin && str_ends_with($this->email, '@admin.com');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'email', 'gender', 'is_admin']);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = preg_replace("/^(mr|ms|doc|eng|phd)\s*\.\s*/i", "", $value);
    }

    public function setEmailAttribute($value)
    {
        $this->attributes['email'] = strtolower($value);
    }

    public function setGenderAttribute($value)
    {
        $this->attributes['gender'] = strtolower($value);
    }

    public function getNameAttribute($value)
    {
        if ($this->gender == 'male') {
            return 'Mr.' . $value;
        } elseif ($this->gender == 'female') {
            return 'Ms.' . $value;
        } else {
            return $value;
        }
    }

    public function posts(): HasMany
    {
        return $this->hasMany(Post::class);
    }

    public function provider(): HasOne
    {
        return $this->hasOne(Provider::class);
    }
}
