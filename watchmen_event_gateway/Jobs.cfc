<cfcomponent output="false">

	<cffunction name="resetRestApplication" output="false" access="package">
		<cftry>
			<cfset restInitApplication(application.rootcontext, application.restservicemapping)>
			<cfcatch>
				<cflog file="Watchmen-RestartRestServices" application="No" text=" ERROR: #cfcatch.message#; #cfcatch.detail#">
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="resetApplication" output="false" access="package">
		<cftry>
			<!--- Resetar aplicação --->
			<cfcatch>
				<cflog file="Watchmen-RestartApplication" application="No" text=" ERROR: #cfcatch.message#; #cfcatch.detail#">
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="resetORM" output="false" access="package">
		<cftry>
			<cfset resetORM()>
			<cfcatch>
				<cflog file="Watchmen-RestartORM" application="No" text=" ERROR: #cfcatch.message#; #cfcatch.detail#">
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="runUnitTests" output="false" access="package">
		<cftry>
			<!--- do something --->
			<cfcatch>
				<cflog file="Watchmen-RunUnitTests" application="No" text=" ERROR: #cfcatch.message#; #cfcatch.detail#">
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="syncFTP" output="false" access="package">
		<cftry>
			<!--- do something --->
			<cfcatch>
				<cflog file="Watchmen-SyncFTP" application="No" text=" ERROR: #cfcatch.message#; #cfcatch.detail#">
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>