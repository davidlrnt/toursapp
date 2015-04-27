class CategoriesController < ApplicationController
end





# <%# binding.pry %>
#     <style>
#       html, body, .map {
#         height: 100%;
#         margin: 0px;
#         padding: 0px;
#         width: 80%;
#       }
#       .panel {
#         position: absolute;
#         top: 5px;
#         left: 50%;
#         margin-left: -180px;
#         z-index: 5;
#         background-color: #fff;
#         padding: 5px;
#         border: 1px solid #999;
#       }
#     </style>

#     <script>
# var directionsDisplay;
# var  directionsService = new google.maps.DirectionsService();
# var <%= raw "map#{index}" %>;
# var <%= raw "loc#{index}" %> = new google.maps.LatLng(<%= raw "#{@tour.locations[index].lat.to_json}, #{@tour.locations[index].lng.to_json}" %>);
# var <%= raw "loc#{index+1}" %> = new google.maps.LatLng(<%= raw "#{@tour.locations[index+1].lat.to_json}, #{@tour.locations[index+1].lng.to_json}" %>);

# function initialize() {
#   directionsDisplay = new google.maps.DirectionsRenderer();
#   var mapOptions = {
#     zoom: 14,
#     center: <%= raw "loc#{index}" %>
#   }
#   <%= raw "map#{index}" %> = new google.maps.Map(document.getElementById(<%=   raw "map-canvas#{index}".to_json  %>), mapOptions);
#   directionsDisplay.setMap(<%= raw "loc#{index}" %>);
# }

# function calcRoute() {
#   var selectedMode = document.getElementById(<%=   raw "mode#{index}".to_json  %>).value;
#   var request = {
#       origin: <%= raw "loc#{index}" %>,
#       destination: <%= raw "loc#{index+1}" %>,
#       // Note that Javascript allows us to access the constant
#       // using square brackets and a string value as its
#       // "property."
#       travelMode: google.maps.TravelMode[selectedMode]
#   };
#   directionsService.route(request, function(response, status) {
#     if (status == google.maps.DirectionsStatus.OK) {
#       directionsDisplay.setDirections(response);
#     }
#   });
# }

# google.maps.event.addDomListener(window, 'load', initialize);
#     </script>
#   </head>
#   <body>
# <%=   raw "<div class='panel' id='panel#{index}'></div>"  %>

#     <b>Mode of Travel: </b>
#    <%= raw "<select id='mode#{index}' onchange='calcRoute();'>"  %>
#       <option value="DRIVING">Driving</option>
#       <option value="WALKING">Walking</option>
#       <option value="BICYCLING">Bicycling</option>
#       <option value="TRANSIT">Transit</option>
#     </select>
#     </div>
# <%=   raw "<div class='map' id='map-canvas#{index}'></div>"  %>
# <% binding.pry %>






