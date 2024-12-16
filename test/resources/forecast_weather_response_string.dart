const String forecastWeatherResponseString = '''
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1734296400,
            "main": {
                "temp": 9.34,
                "feels_like": 6,
                "temp_min": 9.34,
                "temp_max": 10.57,
                "pressure": 1030,
                "sea_level": 1030,
                "grnd_level": 1016,
                "humidity": 94,
                "temp_kf": -1.23
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 7.32,
                "deg": 257,
                "gust": 13.57
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-15 21:00:00"
        },
        {
            "dt": 1734307200,
            "main": {
                "temp": 9.66,
                "feels_like": 6.47,
                "temp_min": 9.66,
                "temp_max": 10.3,
                "pressure": 1030,
                "sea_level": 1030,
                "grnd_level": 1016,
                "humidity": 91,
                "temp_kf": -0.64
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 7.13,
                "deg": 254,
                "gust": 13.41
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-16 00:00:00"
        },
        {
            "dt": 1734318000,
            "main": {
                "temp": 9.26,
                "feels_like": 5.95,
                "temp_min": 9.22,
                "temp_max": 9.26,
                "pressure": 1030,
                "sea_level": 1030,
                "grnd_level": 1016,
                "humidity": 89,
                "temp_kf": 0.04
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 90
            },
            "wind": {
                "speed": 7.14,
                "deg": 245,
                "gust": 14.57
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-16 03:00:00"
        },
        {
            "dt": 1734328800,
            "main": {
                "temp": 9.76,
                "feels_like": 6.52,
                "temp_min": 9.76,
                "temp_max": 9.76,
                "pressure": 1030,
                "sea_level": 1030,
                "grnd_level": 1016,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 7.39,
                "deg": 248,
                "gust": 13.79
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-16 06:00:00"
        },
        {
            "dt": 1734339600,
            "main": {
                "temp": 9.39,
                "feels_like": 6.45,
                "temp_min": 9.39,
                "temp_max": 9.39,
                "pressure": 1031,
                "sea_level": 1031,
                "grnd_level": 1017,
                "humidity": 85,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 91
            },
            "wind": {
                "speed": 6.06,
                "deg": 243,
                "gust": 12.42
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-16 09:00:00"
        },
        {
            "dt": 1734350400,
            "main": {
                "temp": 10.21,
                "feels_like": 9.35,
                "temp_min": 10.21,
                "temp_max": 10.21,
                "pressure": 1030,
                "sea_level": 1030,
                "grnd_level": 1017,
                "humidity": 79,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 95
            },
            "wind": {
                "speed": 6.88,
                "deg": 243,
                "gust": 11.64
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-16 12:00:00"
        },
        {
            "dt": 1734361200,
            "main": {
                "temp": 9.39,
                "feels_like": 6.18,
                "temp_min": 9.39,
                "temp_max": 9.39,
                "pressure": 1029,
                "sea_level": 1029,
                "grnd_level": 1016,
                "humidity": 81,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 6.93,
                "deg": 243,
                "gust": 13.53
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-16 15:00:00"
        },
        {
            "dt": 1734372000,
            "main": {
                "temp": 8.41,
                "feels_like": 5.19,
                "temp_min": 8.41,
                "temp_max": 8.41,
                "pressure": 1029,
                "sea_level": 1029,
                "grnd_level": 1016,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 6.09,
                "deg": 238,
                "gust": 13.35
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-16 18:00:00"
        },
        {
            "dt": 1734382800,
            "main": {
                "temp": 6.9,
                "feels_like": 3.78,
                "temp_min": 6.9,
                "temp_max": 6.9,
                "pressure": 1030,
                "sea_level": 1030,
                "grnd_level": 1016,
                "humidity": 94,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 29
            },
            "wind": {
                "speed": 4.85,
                "deg": 236,
                "gust": 12.37
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-16 21:00:00"
        },
        {
            "dt": 1734393600,
            "main": {
                "temp": 5.77,
                "feels_like": 3.11,
                "temp_min": 5.77,
                "temp_max": 5.77,
                "pressure": 1029,
                "sea_level": 1029,
                "grnd_level": 1015,
                "humidity": 96,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 34
            },
            "wind": {
                "speed": 3.48,
                "deg": 218,
                "gust": 8.21
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-17 00:00:00"
        },
        {
            "dt": 1734404400,
            "main": {
                "temp": 5.61,
                "feels_like": 2.79,
                "temp_min": 5.61,
                "temp_max": 5.61,
                "pressure": 1027,
                "sea_level": 1027,
                "grnd_level": 1014,
                "humidity": 94,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 97
            },
            "wind": {
                "speed": 3.68,
                "deg": 216,
                "gust": 9.96
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-17 03:00:00"
        },
        {
            "dt": 1734415200,
            "main": {
                "temp": 5.91,
                "feels_like": 3.31,
                "temp_min": 5.91,
                "temp_max": 5.91,
                "pressure": 1026,
                "sea_level": 1026,
                "grnd_level": 1012,
                "humidity": 96,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 3.43,
                "deg": 200,
                "gust": 10.13
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-17 06:00:00"
        },
        {
            "dt": 1734426000,
            "main": {
                "temp": 7.94,
                "feels_like": 4.96,
                "temp_min": 7.94,
                "temp_max": 7.94,
                "pressure": 1024,
                "sea_level": 1024,
                "grnd_level": 1011,
                "humidity": 97,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 5.13,
                "deg": 193,
                "gust": 12.61
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-17 09:00:00"
        },
        {
            "dt": 1734436800,
            "main": {
                "temp": 9.02,
                "feels_like": 5.88,
                "temp_min": 9.02,
                "temp_max": 9.02,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 1008,
                "humidity": 90,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 6.35,
                "deg": 193,
                "gust": 13.44
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-17 12:00:00"
        },
        {
            "dt": 1734447600,
            "main": {
                "temp": 8.69,
                "feels_like": 5.22,
                "temp_min": 8.69,
                "temp_max": 8.69,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 1005,
                "humidity": 92,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 7.13,
                "deg": 189,
                "gust": 13.87
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-17 15:00:00"
        },
        {
            "dt": 1734458400,
            "main": {
                "temp": 8.45,
                "feels_like": 4.65,
                "temp_min": 8.45,
                "temp_max": 8.45,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1001,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 8.04,
                "deg": 183,
                "gust": 18.79
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-17 18:00:00"
        },
        {
            "dt": 1734469200,
            "main": {
                "temp": 9.59,
                "feels_like": 5.62,
                "temp_min": 9.59,
                "temp_max": 9.59,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 998,
                "humidity": 88,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 10.25,
                "deg": 198,
                "gust": 19.81
            },
            "visibility": 10000,
            "pop": 0.97,
            "rain": {
                "3h": 0.54
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-17 21:00:00"
        },
        {
            "dt": 1734480000,
            "main": {
                "temp": 10.55,
                "feels_like": 10.06,
                "temp_min": 10.55,
                "temp_max": 10.55,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 995,
                "humidity": 92,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 9.97,
                "deg": 207,
                "gust": 18.94
            },
            "visibility": 10000,
            "pop": 1,
            "rain": {
                "3h": 1.2
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-18 00:00:00"
        },
        {
            "dt": 1734490800,
            "main": {
                "temp": 13.18,
                "feels_like": 12.83,
                "temp_min": 13.18,
                "temp_max": 13.18,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 994,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 10.1,
                "deg": 230,
                "gust": 18.56
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-18 03:00:00"
        },
        {
            "dt": 1734501600,
            "main": {
                "temp": 12.19,
                "feels_like": 11.61,
                "temp_min": 12.19,
                "temp_max": 12.19,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 994,
                "humidity": 82,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 9.97,
                "deg": 227,
                "gust": 18.62
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-18 06:00:00"
        },
        {
            "dt": 1734512400,
            "main": {
                "temp": 11.92,
                "feels_like": 11.33,
                "temp_min": 11.92,
                "temp_max": 11.92,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 995,
                "humidity": 83,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 10.91,
                "deg": 240,
                "gust": 17.85
            },
            "visibility": 10000,
            "pop": 0.2,
            "rain": {
                "3h": 0.13
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-18 09:00:00"
        },
        {
            "dt": 1734523200,
            "main": {
                "temp": 11.18,
                "feels_like": 10.6,
                "temp_min": 11.18,
                "temp_max": 11.18,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 996,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 96
            },
            "wind": {
                "speed": 8.08,
                "deg": 239,
                "gust": 13.32
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-18 12:00:00"
        },
        {
            "dt": 1734534000,
            "main": {
                "temp": 10.31,
                "feels_like": 9.72,
                "temp_min": 10.31,
                "temp_max": 10.31,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 995,
                "humidity": 89,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 5.41,
                "deg": 215,
                "gust": 11.15
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-18 15:00:00"
        },
        {
            "dt": 1734544800,
            "main": {
                "temp": 10.91,
                "feels_like": 10.51,
                "temp_min": 10.91,
                "temp_max": 10.91,
                "pressure": 1004,
                "sea_level": 1004,
                "grnd_level": 991,
                "humidity": 94,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 6.39,
                "deg": 183,
                "gust": 12.96
            },
            "visibility": 7815,
            "pop": 0.26,
            "rain": {
                "3h": 0.26
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-18 18:00:00"
        },
        {
            "dt": 1734555600,
            "main": {
                "temp": 12.25,
                "feels_like": 11.93,
                "temp_min": 12.25,
                "temp_max": 12.25,
                "pressure": 999,
                "sea_level": 999,
                "grnd_level": 986,
                "humidity": 92,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 501,
                    "main": "Rain",
                    "description": "moderate rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 10.17,
                "deg": 208,
                "gust": 17.86
            },
            "visibility": 10000,
            "pop": 1,
            "rain": {
                "3h": 6.33
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-18 21:00:00"
        },
        {
            "dt": 1734566400,
            "main": {
                "temp": 11.34,
                "feels_like": 10.78,
                "temp_min": 11.34,
                "temp_max": 11.34,
                "pressure": 996,
                "sea_level": 996,
                "grnd_level": 983,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 8.68,
                "deg": 231,
                "gust": 16.08
            },
            "visibility": 10000,
            "pop": 1,
            "rain": {
                "3h": 2.64
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-19 00:00:00"
        },
        {
            "dt": 1734577200,
            "main": {
                "temp": 4.74,
                "feels_like": -0.24,
                "temp_min": 4.74,
                "temp_max": 4.74,
                "pressure": 997,
                "sea_level": 997,
                "grnd_level": 984,
                "humidity": 91,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 8.23,
                "deg": 292,
                "gust": 13.79
            },
            "visibility": 10000,
            "pop": 0.88,
            "rain": {
                "3h": 0.34
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-19 03:00:00"
        },
        {
            "dt": 1734588000,
            "main": {
                "temp": 4.49,
                "feels_like": -0.49,
                "temp_min": 4.49,
                "temp_max": 4.49,
                "pressure": 1000,
                "sea_level": 1000,
                "grnd_level": 987,
                "humidity": 82,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 98
            },
            "wind": {
                "speed": 7.99,
                "deg": 325,
                "gust": 13.59
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-19 06:00:00"
        },
        {
            "dt": 1734598800,
            "main": {
                "temp": 4.14,
                "feels_like": -0.92,
                "temp_min": 4.14,
                "temp_max": 4.14,
                "pressure": 1004,
                "sea_level": 1004,
                "grnd_level": 991,
                "humidity": 77,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 60
            },
            "wind": {
                "speed": 7.93,
                "deg": 311,
                "gust": 14.65
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-19 09:00:00"
        },
        {
            "dt": 1734609600,
            "main": {
                "temp": 5.26,
                "feels_like": 0.18,
                "temp_min": 5.26,
                "temp_max": 5.26,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 994,
                "humidity": 76,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 43
            },
            "wind": {
                "speed": 9.11,
                "deg": 298,
                "gust": 14.89
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-19 12:00:00"
        },
        {
            "dt": 1734620400,
            "main": {
                "temp": 5.16,
                "feels_like": 0.31,
                "temp_min": 5.16,
                "temp_max": 5.16,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 997,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 32
            },
            "wind": {
                "speed": 8.24,
                "deg": 308,
                "gust": 14.04
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-19 15:00:00"
        },
        {
            "dt": 1734631200,
            "main": {
                "temp": 4.08,
                "feels_like": -0.6,
                "temp_min": 4.08,
                "temp_max": 4.08,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1001,
                "humidity": 77,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 28
            },
            "wind": {
                "speed": 6.82,
                "deg": 316,
                "gust": 13.93
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-19 18:00:00"
        },
        {
            "dt": 1734642000,
            "main": {
                "temp": 3.46,
                "feels_like": -0.89,
                "temp_min": 3.46,
                "temp_max": 3.46,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 1004,
                "humidity": 82,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 8
            },
            "wind": {
                "speed": 5.63,
                "deg": 295,
                "gust": 13.07
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-19 21:00:00"
        },
        {
            "dt": 1734652800,
            "main": {
                "temp": 2.94,
                "feels_like": -1.43,
                "temp_min": 2.94,
                "temp_max": 2.94,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 1006,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 5
            },
            "wind": {
                "speed": 5.38,
                "deg": 287,
                "gust": 13.24
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-20 00:00:00"
        },
        {
            "dt": 1734663600,
            "main": {
                "temp": 3.06,
                "feels_like": -1.44,
                "temp_min": 3.06,
                "temp_max": 3.06,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 1008,
                "humidity": 84,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 71
            },
            "wind": {
                "speed": 5.73,
                "deg": 286,
                "gust": 13.45
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-20 03:00:00"
        },
        {
            "dt": 1734674400,
            "main": {
                "temp": 2.4,
                "feels_like": -1.66,
                "temp_min": 2.4,
                "temp_max": 2.4,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 1008,
                "humidity": 88,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 83
            },
            "wind": {
                "speed": 4.53,
                "deg": 255,
                "gust": 10.26
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-20 06:00:00"
        },
        {
            "dt": 1734685200,
            "main": {
                "temp": 2.61,
                "feels_like": -0.96,
                "temp_min": 2.61,
                "temp_max": 2.61,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 1007,
                "humidity": 90,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 3.82,
                "deg": 228,
                "gust": 10.69
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-20 09:00:00"
        },
        {
            "dt": 1734696000,
            "main": {
                "temp": 5.75,
                "feels_like": 1.73,
                "temp_min": 5.75,
                "temp_max": 5.75,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 1004,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 6.29,
                "deg": 223,
                "gust": 13.55
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-20 12:00:00"
        },
        {
            "dt": 1734706800,
            "main": {
                "temp": 6.72,
                "feels_like": 2.78,
                "temp_min": 6.72,
                "temp_max": 6.72,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 1001,
                "humidity": 88,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 6.84,
                "deg": 219,
                "gust": 13.58
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2024-12-20 15:00:00"
        },
        {
            "dt": 1734717600,
            "main": {
                "temp": 6.53,
                "feels_like": 3.12,
                "temp_min": 6.53,
                "temp_max": 6.53,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 999,
                "humidity": 95,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 5.31,
                "deg": 214,
                "gust": 11.45
            },
            "visibility": 10000,
            "pop": 1,
            "rain": {
                "3h": 1.65
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2024-12-20 18:00:00"
        }
    ],
    "city": {
        "id": 2637827,
        "name": "Silverstone",
        "coord": {
            "lat": 52.0922,
            "lon": -1.026
        },
        "country": "GB",
        "population": 1742,
        "timezone": 0,
        "sunrise": 1734250002,
        "sunset": 1734277934
    }
}
''';
