<cfsilent>
<cfsavecontent variable="local.str"><cfoutput>
<script type="text/javascript" src="#rc.MFBean.getPluginWebRoot()#/forum/assets/js/editthread.js"></script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>