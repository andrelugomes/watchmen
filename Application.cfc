<cfscript>
component output="false"
{
    //APP
    this.name = "ArtGallery";
    this.applicationTimeout = createTimespan(0,2,0,0);
    this.datasource = "cfartgallery";
    //ORM
    this.ormenabled = "true";
    this.ormsettings = {
				    	datasource="cfartgallery", 
				    	logsql="true"
    					};    
    //REST
    this.restsettings.skipCFCWithError = true;
    
    public boolean function onApplicationStart()
    {
    	application.restservicemapping = this.name;
    	application.rootcontext = getDirectoryFromPath(getCurrentTemplatePath());
        restInitApplication(application.rootcontext, application.restservicemapping);
        ORMreload(); 
        return true;
    } 
     
    public boolean function onRequestStart()
    {
    	if(structKeyExists(url, "resetApp"))
        {
            onApplicationStart();
        }
        
        //http://127.0.0.1:8500/artgallery/?refreshRestServices = para criar o RestPath no CFIDE
        if(structKeyExists(url, "refreshRestServices"))
        {
            restInitApplication(application.rootcontext, application.restservicemapping);
        }
        
        if(structKeyExists(url, "refreshORM"))
        {
            ORMreload();
        }
         
        return true;
    }
}
</cfscript>