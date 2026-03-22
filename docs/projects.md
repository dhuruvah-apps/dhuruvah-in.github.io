# Projects

## ndastro-engine

**A modern Vedic astrology calculation engine for Python**

[![Version](https://img.shields.io/badge/version-0.17.0-blue.svg)](https://github.com/dhuruvah-apps/ndastro-core)
[![Python](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/dhuruvah-apps/ndastro-core/blob/main/LICENSE)

### Overview

ndastro-engine is a high-precision Python library for Vedic astronomical calculations built on JPL ephemeris data. It provides type-safe, accurate calculations for birth charts, planetary positions, and various ayanamsa systems.

### Key Features

- 🪐 **Planetary Positions** - Geocentric apparent positions for all major planets (Sun, Moon, Mars, Mercury, Jupiter, Venus, Saturn)
- 🚀 **Planetary Velocities** - Speed components for longitude, latitude, and distance rates
- 🌅 **Sunrise & Sunset** - Accurate calculations with timezone support
- 🌙 **Lunar Nodes** - Rahu (North Node) and Ketu (South Node) calculations
- ⬆️ **Ascendant (Lagna)** - Rising sign calculations for birth charts
- 🔄 **16 Ayanamsa Systems** - Lahiri, Raman, Krishnamurti (KP New & Old), Fagan-Bradley, and traditional/star-based systems
- 🏷️ **Type-safe Enums** - PlanetCode, HouseCode, NakshatraCode, RasiCode with IDE autocomplete
- 📍 **27 Nakshatras** - Lunar mansions with lord lookup
- ✅ **High Precision** - Verified against astro-seek.com reference
- 🔧 **Retrograde & Combustion** - Planetary motion and combustion analysis

### Technology Stack

- **Python 3.10+** - Modern Python with full type hints
- **Skyfield 1.53+** - JPL ephemeris (DE440s) for astronomical calculations
- **pytz** - Timezone handling
- **Type Safety** - Full type annotations with mypy checking

### Installation

```bash
pip install ndastro-engine
```

### Links

- **GitHub Repository**: [dhuruvah-apps/ndastro-core](https://github.com/dhuruvah-apps/ndastro-core)
- **Documentation**: [https://ndastro-engine.dhuruvah.in/](https://ndastro-engine.dhuruvah.in/)
- **PyPI Package**: [ndastro-engine](https://pypi.org/project/ndastro-engine/)

---

## ndastro-api

**REST API for astrological data and calculations**

[![Version](https://img.shields.io/badge/version-0.2.3-blue.svg)](https://github.com/dhuruvah-apps/ndastro-api)
[![Python](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.115+-green.svg)](https://fastapi.tiangolo.com/)

### Overview

ndastro-api is a production-ready REST API designed to serve comprehensive astrological data and calculations. Built with FastAPI, it provides enterprise features including authentication, tiered access control, and extensive astrological computation capabilities powered by ndastro-engine.

### Key Features

**Astrological Calculations:**
- Sidereal planetary positions and lunar nodes
- Planetary aspects and velocities
- South Indian chart generation with SVG rendering
- Vimsottari Dasha predictions
- Yogas (astrological combinations)
- Transits and transit effects
- Ashtakavarga calculations
- Shadbala (six-fold planetary strength)
- Avasthas (planetary states)
- Longevity calculations
- Nakshatra traits analysis
- Kattams and divisional charts

**Enterprise Features:**
- User authentication with JWT tokens
- Role-based subscription tiers
- Profile management
- Multi-language support (i18n via Babel)
- Error tracking with Sentry
- Rate limiting support
- Database migrations with Alembic

### Technology Stack

**Backend Framework:**
- FastAPI 0.115+ with Uvicorn ASGI server
- Python 3.10+
- SQLModel 0.0.24 (SQLAlchemy-based ORM)
- Pydantic 2.11+ for data validation

**Database:**
- PostgreSQL / SQLite support
- AsyncPG for async operations
- Alembic for migrations

**Authentication & Security:**
- JWT with PyJWT
- BCrypt password hashing
- OAuth2 with Bearer tokens
- Token blacklisting support

**Core Dependencies:**
- Skyfield 1.53 - Astronomical calculations
- ndastro-engine 0.17.0 - Astrological computation engine
- HTTPX - Async HTTP client
- Tenacity - Retry logic
- FastAPI-Babel - Internationalization

**Development Tools:**
- Pytest with coverage
- Ruff for linting
- MyPy for type checking
- MkDocs with Material theme

### API Endpoints

- `/api/v1/auth/` - Login/logout and token management
- `/api/v1/users/` - User management and profiles
- `/api/v1/tiers/` - Subscription tier management
- `/api/v1/astro/` - Astrological calculations (planetary positions, charts, dasha, yogas, transits, etc.)
- `/api/v1/health/` - Health check endpoint
- `/api/v1/docs` - Swagger/OpenAPI documentation

### Architecture

The API follows a clean architecture pattern with clear separation of concerns:

- **`api/`** - Route handlers and API endpoints
- **`core/`** - Configuration, security, and database setup
- **`services/`** - Business logic for astrological calculations
- **`models/`** - Database models
- **`schemas/`** - Request/response schemas
- **`crud/`** - Database operations
- **`middlewares/`** - Request/response middleware

### Notable Capabilities

- High-performance data loading with preloaded astrological data
- Multi-timezone support with timezone-aware calculations
- Chart visualization with South Indian chart SVGs
- Customizable language support for charts and responses
- Soft deletes with deletion tracking
- Admin features with superuser roles
- Comprehensive test coverage

### Links

- **GitHub Repository**: [dhuruvah-apps/ndastro-api](https://github.com/dhuruvah-apps/ndastro-api)
- **API Documentation**: Available at `/api/v1/docs` when running

---

## Getting Started

Both projects use Poetry for dependency management. To get started:

### For ndastro-engine:
```bash
pip install ndastro-engine
```

### For ndastro-api:
```bash
# Clone the repository
git clone https://github.com/dhuruvah-apps/ndastro-api.git
cd ndastro-api

# Install dependencies
poetry install

# Run migrations
poetry run db-migrate

# Initialize seed data
poetry run init-data

# Start the server
poetry run uvicorn app.main:app --reload
```

Visit the API documentation at `http://localhost:8000/api/v1/docs`
