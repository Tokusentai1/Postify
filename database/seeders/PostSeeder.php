<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Models\Post;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();
        for ($i = 0; $i < 10; $i++) {
            Post::create([
                'title' => $faker->sentence(4, true),
                'description' => $faker->text(50),
                'image' => $faker->imageUrl(),
                'user_id' => $faker->numberBetween(1, 10),
            ]);
        }
    }
}
