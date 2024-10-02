<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Postify

**Postify** is a social media posting application that allows users to create and view posts organized into various categories. 

### Key Features
- Developed API endpoints for post creation, editing, and viewing, with validation rules applied.
- Integrated **Sanctum** for authentication and email verification.
- Implemented password reset functionality and send emails using Mailable.
- Set up search functionality using **Scout** with **Meilisearch** for typo-tolerant search.
- Built a **Filament dashboard** for admin management of posts, users, and categories, featuring role-based permissions, translations, and theme customization.
- Implemented authorization policies to restrict post editing and deletion to the original post creator.
- Utilized observers to handle image deletions, ensuring consistency between posts and files.

## Learning Laravel

Laravel has extensive [documentation](https://laravel.com/docs) and a video tutorial library, making it easy to get started with the framework. For guided learning, consider trying the [Laravel Bootcamp](https://bootcamp.laravel.com) or check out [Laracasts](https://laracasts.com) for thousands of video tutorials on various topics.

## Contributing

Contributions to Postify are welcome! Please follow the guidelines in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

To ensure a welcoming community, please review and adhere to the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## License

Postify is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
