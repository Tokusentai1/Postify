<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\UserResource\RelationManagers\PostsRelationManager;
use Rmsramos\Activitylog\Actions\ActivityLogTimelineTableAction;
use App\Filament\Admin\Resources\UserResource\Pages;
use Filament\Forms\Components\Section;
use Filament\Support\Enums\FontFamily;
use Filament\Support\Enums\FontWeight;
use Filament\Resources\Resource;
use Filament\Tables\Table;
use Filament\Forms\Form;
use Filament\Tables;
use App\Models\User;
use Filament\Forms;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-circle';

    protected static ?string $activeNavigationIcon = 'heroicon-c-user-circle';

    protected static ?string $navigationGroup = 'Users Information';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make(__('user_fields.create_user'))
                    ->description(__('user_fields.create_user_desc'))
                    ->collapsible()
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->label(__('user_fields.name'))
                            ->prefixIcon('heroicon-o-user')
                            ->prefixIconColor('primary')
                            ->notRegex('/[0-9]/')
                            ->minLength(3)
                            ->maxLength(20)
                            ->required(),
                        Forms\Components\TextInput::make('email')
                            ->label(__('user_fields.email'))
                            ->prefixIcon('heroicon-o-envelope')
                            ->prefixIconColor('primary')
                            ->email()
                            ->unique(table: User::class, ignoreRecord: true)
                            ->required(),
                        Forms\Components\TextInput::make('password')
                            ->label(__('user_fields.password'))
                            ->prefixIcon('heroicon-o-key')
                            ->prefixIconColor('primary')
                            ->password()
                            ->regex('/[0-9]/, /[!@#$%^]/')
                            ->minLength(8)
                            ->maxLength(30)
                            ->required(),
                        Forms\Components\Select::make('gender')
                            ->label(__('user_fields.gender'))
                            ->prefixIcon('heroicon-o-funnel')
                            ->prefixIconColor('primary')
                            ->options([
                                'male' => __('user_fields.male'),
                                'female' => __('user_fields.female'),
                            ])
                            ->required(),
                        Forms\Components\Toggle::make('is_admin')
                            ->label(__('user_fields.admin'))
                            ->onIcon('heroicon-o-check')
                            ->onColor('primary')
                            ->offIcon('heroicon-o-x-mark')
                            ->offColor('danger')
                            ->inline(false)
                            ->required(),
                    ])->columns(3),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label(__('user_fields.name'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-user')
                    ->iconColor('primary')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('email')
                    ->label(__('user_fields.email'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-envelope')
                    ->iconColor('primary')
                    ->copyable()
                    ->copyMessage(__('user_fields.email_copied'))
                    ->copyMessageDuration(3000)
                    ->weight(FontWeight::Bold)
                    ->fontFamily(FontFamily::Serif)
                    ->toggleable(),
                Tables\Columns\TextColumn::make('email_verified_at')
                    ->label(__('user_fields.email_verified_at'))
                    ->dateTime('Y-M-d')
                    ->icon('heroicon-s-calendar')
                    ->iconColor('primary')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('gender')
                    ->label(__('user_fields.gender'))
                    ->toggleable(),
                Tables\Columns\IconColumn::make('is_admin')
                    ->label(__('user_fields.admin'))
                    ->boolean()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label(__('user_fields.created_at'))
                    ->dateTime('Y-m-d H:i:s')
                    ->icon('heroicon-s-calendar')
                    ->iconColor('primary')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label(__('user_fields.updated_at'))
                    ->dateTime('Y-m-d H:i:s')
                    ->icon('heroicon-s-calendar')
                    ->iconColor('primary')
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                ActivityLogTimelineTableAction::make('Activities')
                    ->label(__('user_fields.activity_log')),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            PostsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
