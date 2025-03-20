sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'samplecapforfiorielements2',
            componentId: 'SupplierObjectPage',
            contextPath: '/Supplier'
        },
        CustomPageDefinitions
    );
});