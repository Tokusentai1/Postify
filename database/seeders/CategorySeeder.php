<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();
        for ($i = 0; $i < 3; $i++) {
            $name = $faker->randomElement(['Personal', 'Work', 'Hobby']);
            Category::create([
                'name' => $name,
            ]);
        }
    }
}
