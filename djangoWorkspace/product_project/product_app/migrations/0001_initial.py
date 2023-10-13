# Generated by Django 3.0.14 on 2023-10-13 01:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('prd_no', models.IntegerField(primary_key=True, serialize=False)),
                ('prd_name', models.TextField(blank=True, null=True)),
                ('prd_price', models.IntegerField(blank=True, null=True)),
                ('prd_maker', models.TextField(blank=True, null=True)),
                ('prd_color', models.TextField(blank=True, null=True)),
                ('ctg_no', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'product',
                'managed': False,
            },
        ),
    ]
