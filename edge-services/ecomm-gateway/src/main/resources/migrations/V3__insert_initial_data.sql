CREATE SCHEMA IF NOT EXISTS "public";
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Insert user with provided email and password
INSERT INTO "public".users (email, passwd, first_name, last_name, mobile, provider, status, subject)
VALUES ('admin@example.com', crypt('password', gen_salt('bf')), 'admin', 'user', '1234567890', 'app', 'ACTIVE_NOT_VERIFIED', 'app|98eb674da7c733b21ac0e0db');
--VALUES ('admin@example.com', 'password', 'admin', 'user', '1234567890', 'app', 'ACTIVE_NOT_VERIFIED', 'app|98eb674da7c733b21ac0e0db');

-- Insert role for the user
INSERT INTO "public".user_roles (user_id, "role")
VALUES (1, 'ADMIN');


-- Insert categories
INSERT INTO "public".category (name, parent_id) VALUES ('Electronics', NULL);
INSERT INTO "public".category (name, parent_id) VALUES ('Laptops', (SELECT id FROM "public".category WHERE name = 'Electronics'));
INSERT INTO "public".category (name, parent_id) VALUES ('Smartphones', (SELECT id FROM "public".category WHERE name = 'Electronics'));

-- Insert brands
INSERT INTO "public".brand (name, brand_category) VALUES ('Dell', 'PC Electronics');
INSERT INTO "public".brand (name, brand_category) VALUES ('Lenovo', 'PC Electronics');
INSERT INTO "public".brand (name, brand_category) VALUES ('Asus', 'Electronics');
INSERT INTO "public".brand (name, brand_category) VALUES ('Apple', 'PC & Phones');

-- Insert feature templates
INSERT INTO "public".feature_template (category_id, features) VALUES ((SELECT id FROM "public".category WHERE name = 'Laptops'), '[
    {
        "name": "brand",
        "placeholder": "Example: Dell"
    },
    {
        "name": "model_name",
        "placeholder": "Example: XPS 15"
    },
    {
        "name": "screen_size",
        "placeholder": "Example: 15.6 inches"
    },
    {
        "name": "hard_drive",
        "placeholder": "Example: 1TB SSD"
    },
    {
        "name": "operating_system",
        "placeholder": "Example: Windows 10 Pro"
    },
    {
        "name": "graphics_card_description",
        "placeholder": "Example: NVIDIA GeForce RTX 3050"
    },
    {
        "name": "graphics_coprocessor",
        "placeholder": "Example: NVIDIA"
    },
    {
        "name": "chipset_brand",
        "placeholder": "Example: Intel"
    },
    {
        "name": "graphics_memory_size",
        "placeholder": "Example: 4 GB"
    },
    {
        "name": "wireless_standard",
        "placeholder": "Example: 802.11ax (WiFi 6)"
    },
    {
        "name": "usb_3.0_ports",
        "placeholder": "Example: 2 ports"
    },
    {
        "name": "average_battery_life_(in_hours)",
        "placeholder": "Example: 8 hours"
    },
    {
        "name": "item_model_number",
        "placeholder": "Example: XPS159560"
    },
    {
        "name": "number_of_processors",
        "placeholder": "Example: 6"
    },
    {
        "name": "memory_type",
        "placeholder": "Example: DDR4 SDRAM"
    },
    {
        "name": "voltage",
        "placeholder": "Example: 19.5V"
    },
    {
        "name": "batteries",
        "placeholder": "Example: 1 Lithium ion battery required"
    }
]');
INSERT INTO "public".feature_template (category_id, features) VALUES ((SELECT id FROM "public".category WHERE name = 'Smartphones'), '[
  {
    "name": "model",
    "placeholder": "Example: Galaxy S22"
  },
  {
    "name": "screen_size",
    "placeholder": "Example: 6.2 inches"
  },
  {
    "name": "operating_system",
    "placeholder": "Example: Android 12"
  },
  {
    "name": "processor_type",
    "placeholder": "Example: Snapdragon 888"
  },
  {
    "name": "battery_capacity",
    "placeholder": "Example: 3700mAh"
  },
  {
    "name": "camera_resolution",
    "placeholder": "Example: 108MP Rear, 10MP Front"
  },
  {
    "name": "connectivity",
    "placeholder": "Example: 5G, Wi-Fi, Bluetooth 5.2"
  },
  {
    "name": "weight",
    "placeholder": "Example: 167g"
  },
  {
    "name": "dimensions",
    "placeholder": "Example: 146 x 70 x 7.6 mm"
  },
  {
    "name": "release_year",
    "placeholder": "Example: 2023"
  },
  {
    "name": "water_resistance",
    "placeholder": "Example: IP68"
  },
  {
    "name": "warranty",
    "placeholder": "Example: 1 Year Manufacturer Warranty"
  }
]');


INSERT INTO "public".master_variant (category_id, feature_names)
VALUES
    ((SELECT id FROM "public".category WHERE name = 'Smartphones'), '{"storage": "256GB", "color": "Midnight Blue", "ram": "8GB"}');

INSERT INTO "public".master_variant (category_id, feature_names)
VALUES
    ((SELECT id FROM "public".category WHERE name = 'Laptops'), '{
    "storage": "Example: 512GB SSD",
    "color": "Example: Silver",
    "ram": "Example: 16GB DDR4",
    "touchscreen": "Yes"
}');

COMMENT ON TABLE "public".feature_template IS 'This table provides template for all features for a particular category';

COMMENT ON COLUMN "public".master_variant.feature_names IS 'list of feature names for a particular category';

COMMENT ON COLUMN "public".users.subject IS 'used for userinfor in oauth';