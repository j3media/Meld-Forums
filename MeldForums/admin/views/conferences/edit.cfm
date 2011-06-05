<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui-tabs.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm">
<input type="hidden" name="action" value="conferences.edit">
<input type="hidden" name="conferenceID" value="#local.rc.conferenceBean.getConferenceID()#">
<div id="msTabs">
	<ul>
		<li><a id="msTabs-General-Tab" href="##msTabs-General">#local.rc.mmRBF.key('general')#</a></li>
		<li><a id="msTabs-Options-Tab" href="##msTabs-Options">#local.rc.mmRBF.key('options')#</a></li>
		<li><a id="msTabs-Config-Tab" href="##msTabs-Config">#local.rc.mmRBF.key('configuration')#</a></li>
	</ul>
	<div id="msTabs-panels">
		#view("conferences/includes/conferences_edit_general")#
		#view("conferences/includes/conferences_edit_options")#
		#view("conferences/includes/conferences_edit_config")#
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" type="submit" class="submit ui-state-default" value="cancel"></li>
			<cfif local.rc.conferenceBean.beanExists()>
				<li><input name="btaction" type="submit" class="submit ui-state-default" value="update"></li>
				<li class="right">
					<input type="hidden" id="btdeleteconfirm" name="btdeleteconfirm" value="" />
					<input data-delete="#local.rc.mmRBF.key('delete')#" data-cancel="#local.rc.mmRBF.key('cancel')#" data-title="#local.rc.mmRBF.key('delete')#" data-message="#local.rc.mmRBF.key('deleteconference-msg')#" id="btdelete" name="btaction" type="submit" class="submit ui-state-highlight" value="delete">
				</li>
			<cfelse>
				<li><input name="btaction" type="submit" class="submit ui-state-default" value="save"></li>
			</cfif>
		</ul>
	</div>
</div>	
</form>
<!--- end content --->
</cfoutput> 