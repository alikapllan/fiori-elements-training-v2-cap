sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'samplecapforfiorielements2/test/integration/FirstJourney',
		'samplecapforfiorielements2/test/integration/pages/SupplierList',
		'samplecapforfiorielements2/test/integration/pages/SupplierObjectPage'
    ],
    function(JourneyRunner, opaJourney, SupplierList, SupplierObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('samplecapforfiorielements2') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSupplierList: SupplierList,
					onTheSupplierObjectPage: SupplierObjectPage
                }
            },
            opaJourney.run
        );
    }
);