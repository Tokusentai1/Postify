<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Models\Post;

class PivotSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::Create();
        for ($i = 0; $i < 15; $i++) {
            Post::find($faker->numberBetween(1, 10))->categories()->attach($faker->numberBetween(1, 3));
        }
    }
}
