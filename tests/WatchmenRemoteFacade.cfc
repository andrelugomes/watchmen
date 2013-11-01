<cfcomponent extends="mxunit.framework.RemoteFacade" wsversion="1" 
			hint="RemoteFacade proprio para poder usar variaveis de APPLICATION e SESSION">
   <cffunction name="actOnTestCase">
        <cfargument name="TestCase">
 
        <cfif findNoCase("TestManager.Retail",GetMetadata(TestCase).name)>
            <cfinclude template="retail/Application.cfm">
        <cfelse>
            <cfinclude template="/artgallery/Application.cfc">
        </cfif>
    </cffunction> 
</cfcomponent>