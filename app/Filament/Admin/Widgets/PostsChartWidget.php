<?php

namespace App\Filament\Admin\Widgets;

use Filament\Widgets\ChartWidget;
use App\Models\Category;

class PostsChartWidget extends ChartWidget
{
    protected static ?string $heading = 'Posts by Category';

    protected static ?string $maxHeight = '280px';

    protected static ?int $sort = 2;

    protected function getData(): array
    {
        $categroies = Category::pluck('name');

        $posts = Category::withCount('posts')->pluck('posts_count');

        return [
            'datasets' => [
                [
                    'label' => 'Posts',
                    'data' => $posts,
                    'backgroundColor' => [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                    ],
                    'hoverOffset' => 10
                ],
            ],
            'labels' => $categroies,
        ];
    }

    protected function getType(): string
    {
        return 'doughnut';
    }
}
