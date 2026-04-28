# Where's My Tofu?

**Where’s My Tofu?** is a grocery price comparison web application designed for budget-conscious shoppers. It helps users find the best deals across local stores by leveraging AI to scan flyers and optimize shopping routes.

## Key Features

- **AI-Powered Flyer Scanner:** Automatically extract product names and prices from store flyers (チラシ) using Groq (Llama 3/4) and Google Gemini.
- **Price Comparison:** Create shopping lists and instantly see which nearby stores offer the lowest prices for your items.
- **Smart Store Maps:** Visualise store locations and optimize your shopping route via Mapbox GL JS.
- **Background Processing:** Seamlessly process high-resolution flyer uploads using Solid Queue.
- **Mobile-First Design:** Optimized for on-the-go price checking at the supermarket.

## Tech Stack 🛠

* **Framework:** Ruby on Rails 7.1
* **Database:** PostgreSQL (using `jsonb` for flexible data structures)
* **Frontend:** Bootstrap 5, JavaScript (ES6), Mapbox GL JS
* **AI/ML:** Groq (Llama 3/4), Google Gemini (Fallback)
* **Background Jobs:** Solid Queue
* **Image Hosting:** Cloudinary
* **Deployment:** Heroku / Docker

## Getting Started

### Prerequisites

* Ruby (v3.2+ recommended)
* Rails 7.1+
* PostgreSQL

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/virfortis-rgb/wheres-my-tofu.git
    cd wheres-my-tofu
    ```

2.  **Install dependencies:**
    ```bash
    bundle install
    ```

3.  **Database setup:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4.  **Environment Variables:**
    Create a `.env` file in the root directory and add your credentials:
    ```env
    GROQ_API_KEY=your_groq_key
    GEMINI_API_KEY=your_gemini_key
    MAPBOX_API_KEY=your_mapbox_key
    CLOUDINARY_URL=your_cloudinary_url
    ```
    Feel free to only use Gemini.

5.  **Start the application:**
    ```bash
    # Start the rails server and background workers
    ./bin/dev
    ```
    or (open in localhost:3000):
    ```bash
    rails server
    ```

## Dependencies

Major gems and packages used:
- `devise`: For user authentication.
- `cloudinary`: For flyer image storage and transformation.
- `solid_queue`: For background flyer processing.
- `geocoder`: For store location handling.
- `mapbox-gl`: For interactive mapping features.

## The Team
Developed as a group project at **Le Wagon Tokyo**.

- [Damien Joubert (virfortis-rgb)](https://github.com/virfortis-rgb)
- [Mahmud Md Fuad (starrr826-lgtm)](https://github.com/starrr826-lgtm)
- [Mahmud Md Fuad (apppples)](https://github.com/apppples)
- [Mahmud Md Fuad (fuadaman)](https://github.com/fuadaman)

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
