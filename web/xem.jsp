

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Statistic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Revenue Chart</title>
        <!-- Link to Chart.js library -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <!-- Font Awesome -->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Map</title>
        <!-- Link to Leaflet CSS -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <!-- Link to Leaflet JavaScript -->
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Include Chart.js library -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- Include Bootstrap CSS for styling -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Style for map container */
            #world-map-markers {
                height: 325px;
                overflow: hidden;
            }
        </style>

    </head>
    <body>
        <div class="row">
            <jsp:include page="leftManager.jsp"/>
        </div>

        <div class="row" >
            <div class="col-md-6"> 
                <div class="card">
                    <div class="card-header border-0">
                        <div class="d-flex justify-content-between">
                            <h3 class="card-title">Online Store Visitors</h3>
                            <a href="javascript:void(0);">View Report</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex">
                            <p class="d-flex flex-column">
                                <span class="text-bold text-lg">820</span>
                                <span>Visitors Over Time</span>
                            </p>
                            <p class="ml-auto d-flex flex-column text-right">
                                <span class="text-success">
                                    <i class="fas fa-arrow-up"></i> 12.5%
                                </span>
                                <span class="text-muted">Since last week</span>
                            </p>
                        </div>
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">Revenue</h3>
                                    <!-- Remove link to report for simplicity -->
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Canvas for the chart -->
                                <canvas id="revenue-chart" height="200"></canvas>
                            </div>
                        </div>

                        <div class="d-flex flex-row justify-content-end">
                            <span class="mr-2">
                                <i class="fas fa-square text-primary"></i> This Week
                            </span>

                            <span>
                                <i class="fas fa-square text-gray"></i> Last Week
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card card-danger">
                    <div class="card-header">
                        <h3 class="card-title">Donut Chart</h3>

                    </div>
                    <div class="card-body">
                        <div class="chart-container" style="position: relative; height: 300px;">
                            <canvas id="donutChart" style="height: 100%; width: 100%;"></canvas>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

            </div>

            <script>
                // Prepare data for the donut chart
                var data = {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple'],
                    datasets: [{
                            label: 'Donut Chart',
                            data: [12, 19, 3, 5, 2],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.5)',
                                'rgba(54, 162, 235, 0.5)',
                                'rgba(255, 206, 86, 0.5)',
                                'rgba(75, 192, 192, 0.5)',
                                'rgba(153, 102, 255, 0.5)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                };

                // Get the canvas element
                var ctx = document.getElementById('donutChart').getContext('2d');

                // Create the donut chart
                var donutChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: data,
                    options: {
                        // Customize options as needed
                    }
                });
            </script>

            <div class="col-md-6">

                <div class="card-body p-0">
                    <div class="d-md-flex">
                        <div class="p-1 flex-fill" style="overflow: hidden">
                            <!-- Map will be created here -->
                            <div id="world-map-markers"></div>
                        </div>
                    </div><!-- /.d-md-flex -->
                </div>
            </div>
        </div>
        <script>
            // Data for the chart (replace with your actual data)
            var revenueData = {
                labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                datasets: [{
                        label: 'Revenue',
                        data: [1000, 1500, 2000, 1800, 2500, 3000], // Replace with your actual revenue data
                        backgroundColor: 'rgba(54, 162, 235, 0.2)', // Color for the fill area
                        borderColor: 'rgba(54, 162, 235, 1)', // Color for the line
                        borderWidth: 1
                    }]
            };

            // Configuration for the chart
            var revenueConfig = {
                type: 'line',
                data: revenueData,
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            };

            // Get the canvas element
            var revenueCanvas = document.getElementById('revenue-chart').getContext('2d');

            // Create the chart
            var revenueChart = new Chart(revenueCanvas, revenueConfig);
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


        <script>
            // Initialize Leaflet map
            var map = L.map('world-map-markers').setView([16.0544, 108.2022], 6); // Coordinates for Vietnam

            // Add Tile Layer for map
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            // Add marker for Vietnam
            var vietnamMarker = L.marker([21.0285, 105.8542]).addTo(map);
            vietnamMarker.bindPopup("<b>Vietnam</b>").openPopup();
        </script>


    </body>
</html>
