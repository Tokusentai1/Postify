<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();
        for ($i = 0; $i < 10; $i++) {
            $genders = $faker->randomElement(['male', 'female']);
            User::create([
                'name' => $faker->name($genders),
                'email' => $faker->safeEmail(),
                'password' => $faker->password(),
                'gender' => $genders,
            ]);
        }
    }
}
