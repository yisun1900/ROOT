<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String ckdh=request.getParameter("ckdh");
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wlbmlist[]=request.getParameterValues("wlbmlist");
if (wlbmlist==null)
{
	out.println("请输入物流物料编码!");
	return;
}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料出库明细（出库单号：<%=ckdh%>）</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveWlbm.jsp" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC" align="center"> 
		<td width="3%">序号</td>
		<td width="10%">材料类别</td>
		<td width="8%">物流材料编码</td>
		<td width="15%">物流材料名称</td>
		<td width="15%">型号规格</td>
		<td width="15%">品牌</td>
		<td width="8%">结算材料编码</td>
		<td width="15%">结算材料名称</td>
		<td width="5%">计量单位</td>
		<td width="5%">单价</td>
		<td width="5%">出库数量</td>
	</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

int pos=0;
int count=0;
int row=0;
String wlbm=null;
String cldlmc=null;
String glmc=null;
String jswlbm=null;
String jswlmc=null;
String pp=null;
String xhgg=null;
String dj=null;
String cljldwmc=null;
String slStr=null;
double sl=0;
try {
	conn=cf.getConnection();

	for (int i=0;i<wlbmlist.length ;i++ )
	{
		wlbmlist[i]=cf.GB2Uni(wlbmlist[i],"8859_1");
		pos=wlbmlist[i].indexOf(':');
		wlbm=wlbmlist[i].substring(0,pos);

		slStr=wlbmlist[i].substring(pos+1);
		sl=java.lang.Double.parseDouble(slStr.trim());

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;
		ls_sql="SELECT cldlmc,jswlbm,bj_jzcljgb.glmc,bj_jzcljgb.xhgg,bj_jzcljgb.pp,bj_jscljgb.glmc||NVL2(bj_jscljgb.pp,'('||bj_jscljgb.pp||')','') jswlmc,cljldwmc,bj_jzcljgb.dj,bj_jzcljgb.lrr,bj_jzcljgb.lrsj ";
		ls_sql+="  FROM bj_jzcljgb,bdm_cldlbm,bdm_cljldwbm,bj_jscljgb";
		ls_sql+=" where bj_jzcljgb.cldlbm=bdm_cldlbm.cldlbm(+)";
		ls_sql+=" and bj_jzcljgb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_jzcljgb.jswlbm=bj_jscljgb.wlbm(+)";
		ls_sql+=" and bj_jzcljgb.wlbm='"+wlbm+"' and bj_jzcljgb.dqbm='"+dqbm+"'";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=cf.fillNull(rs.getString("cldlmc"));
			glmc=cf.fillNull(rs.getString("glmc"));
			jswlbm=cf.fillHtml(rs.getString("jswlbm"));
			jswlmc=cf.fillHtml(rs.getString("jswlmc"));
			cljldwmc=cf.fillNull(rs.getString("cljldwmc"));
			pp=cf.fillNull(rs.getString("pp"));
			xhgg=cf.fillHtml(rs.getString("xhgg"));
			dj=cf.fillNull(rs.getString("dj"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"><%=(i+1)%></td>
      <td align="center"><%=cldlmc%></td>
      <td align="center"><%=wlbm%>
		<input type="hidden" name="wlbm"  value="<%=wlbm%>" >
	  </td>
      <td align="center"><%=glmc%></td>
      <td align="center"><%=xhgg%></td>
      <td align="center"><%=pp%></td>
       <td align="center"><%=jswlbm%></td>
      <td align="center"><%=jswlmc%></td>
      <td align="center"><%=cljldwmc%></td>
      <td align="center"><%=dj%></td>
      <td align="center">
        <input type="text" name="sl"  value="<%=slStr%>"  size="8" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=(row+1)%>])">
	  </td>
	</tr>
<%
			count++;
			row++;
		}
		ps.close();
		rs.close();

		if (count<1)//不存在
		{
%>
			
    <tr bgcolor="#CC0000"> 
      <td align="center"><%=(i+1)%></td>
      <td align="center" >&nbsp;</td>
      <td align="center"><%=wlbm%></td>
      <td colspan="9" bgcolor="#CC0000">数据不存在</td>
	</tr>
<%
		}
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

    <tr> 
      <td colspan="11" bgcolor="#CCCCCC" > 
        <div align="center"> 
		  <input type="hidden" name="sgd"  value="<%=sgd%>" >
		  <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
		  <input type="hidden" name="ckdh"  value="<%=ckdh%>" >
          <input type="button"  value="保存" onClick="f_do(listform)" name="savebutton">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
</table>
</form> 


</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
