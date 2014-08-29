require.config({
	baseUrl: '/evergreen',
	paths: {
		'accounts': 'apps/accounts',
		'admin': 'apps/admin',
		'glue': 'apps/glue',
		'lightweightviewer': 'apps/lightweightviewer',
		'modelselector': 'apps/modelselector',
	    'js-test': '../js-test',
	    'js-shared': 'shared', 
	    'jquery': 'shared/lib/jquery',
	    'underscore': 'shared/lib/underscore',
	    'hbs': 'shared/lib/hbs',
		'backbone': 'shared/lib/backbone',
        'backbone.babysitter': 'shared/lib/backbone.babysitter',
		'moment': 'shared/lib/moment.min',
		'localstorage': 'shared/lib/backbone.localStorage'
	},
	hbs: {
		disableI18n: true,
		helpers: false
	}
});
