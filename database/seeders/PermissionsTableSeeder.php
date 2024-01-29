<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //permission untuk posts
        Permission::create(['name' => 'posts.index', 'guard_name' => 'api']);
        Permission::create(['name' => 'posts.create', 'guard_name' => 'api']);
        Permission::create(['name' => 'posts.edit', 'guard_name' => 'api']);
        Permission::create(['name' => 'posts.delete', 'guard_name' => 'api']);

        // //permission untuk category
        Permission::create(['name' => 'categories.index', 'guard_name' => 'api']);
        Permission::create(['name' => 'categories.create', 'guard_name' => 'api']);
        Permission::create(['name' => 'categories.edit', 'guard_name' => 'api']);
        Permission::create(['name' => 'categories.delete', 'guard_name' => 'api']);

        // //permission untuk sliders
        Permission::create(['name' => 'sliders.index', 'guard_name' => 'api']);
        Permission::create(['name' => 'sliders.create', 'guard_name' => 'api']);
        Permission::create(['name' => 'sliders.delete', 'guard_name' => 'api']);

        // //permission untuk roles
        Permission::create(['name' => 'roles.index', 'guard_name' => 'api']);
        Permission::create(['name' => 'roles.create', 'guard_name' => 'api']);
        Permission::create(['name' => 'roles.edit', 'guard_name' => 'api']);
        Permission::create(['name' => 'roles.delete', 'guard_name' => 'api']);

        // //permission umtuk permission
        Permission::create(['name' => 'permissions.index', 'guard_name' => 'api']);

        // //permission untuk users
        Permission::create(['name' => 'users.index', 'guard_name' => 'api']);
        Permission::create(['name' => 'users.create', 'guard_name' => 'api']);
        Permission::create(['name' => 'users.edit', 'guard_name' => 'api']);
        Permission::create(['name' => 'users.delete', 'guard_name' => 'api']);
    }
}
