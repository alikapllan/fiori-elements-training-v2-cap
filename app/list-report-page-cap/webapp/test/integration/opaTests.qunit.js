sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'listreportpagecap/test/integration/FirstJourney',
		'listreportpagecap/test/integration/pages/ProductsList',
		'listreportpagecap/test/integration/pages/ProductsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('listreportpagecap') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage
                }
            },
            opaJourney.run
        );
    }
);