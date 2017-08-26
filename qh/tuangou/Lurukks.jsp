<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,gzjs.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
%>
<%
	String wheresql="";
	String qh_tgglb_djrq=null;
	String qh_tgglb_xqmc=null;
	String qh_tgglb_dm=null;
	qh_tgglb_djrq=request.getParameter("sjfw");
	if (qh_tgglb_djrq!=null)
	{
		qh_tgglb_djrq=qh_tgglb_djrq.trim();
		if (!(qh_tgglb_djrq.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+qh_tgglb_djrq+"','YYYY/MM/DD'))";
	}
	qh_tgglb_djrq=request.getParameter("sjfw2");
	if (qh_tgglb_djrq!=null)
	{
		qh_tgglb_djrq=qh_tgglb_djrq.trim();
		if (!(qh_tgglb_djrq.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+qh_tgglb_djrq+"','YYYY/MM/DD'))";
	}
	qh_tgglb_xqmc=request.getParameter("qh_tgglb_xqmc");
	if (qh_tgglb_xqmc!=null)
	{
		qh_tgglb_xqmc=cf.GB2Uni(qh_tgglb_xqmc);
		if (!(qh_tgglb_xqmc.equals("")))	wheresql+="  and (qh_tgglb.xqmc='"+qh_tgglb_xqmc+"')";
	}
	qh_tgglb_dm=request.getParameter("dwbh");
	if (qh_tgglb_dm!=null)
	{
		qh_tgglb_dm=cf.GB2Uni(qh_tgglb_dm);
		if (!(qh_tgglb_dm.equals("")))	wheresql+="  and (dwbh='"+qh_tgglb_dm+"')";
	}
%>
<%

//从咨询客户中选取符合条件的记录
Connection conn  = null;
PreparedStatement ps=null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql3=null;

String xqbm=null;
String zxdm=null;
int zxsl=0;
int qys=0;
int ixh=0;
String xh=null;
String xhs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	//清空团购管理表
//	ls_sql="delete   from qh_tgglb";
	//ps= conn.prepareStatement(ls_sql);
//	ps.executeUpdate();

	ls_sql="insert into  qh_tgglb(xqbm) select distinct dm_xqbm.xqbm from dm_xqbm,crm_zxkhxx where  dm_xqbm.xqbm(+)=crm_zxkhxx.xqbm and dm_xqbm.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();

    //按小区计算咨询客户人数
	ls_sql="select  distinct xqbm from qh_tgglb ";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		xqbm=cf.fillNull(rs.getString("xqbm"));
		//out.println(xqbm);

   		//求某小区的咨询人数
		ls_sql2="select count(khbh) as sl from crm_zxkhxx where xqbm='"+xqbm+"' ";
		ls_sql2+=wheresql;
		ps2= conn.prepareStatement(ls_sql2);
		rs2=ps2.executeQuery();
		if (rs2.next())
		{
			zxsl=rs2.getInt("sl");
			ls_sql3="update qh_tgglb set zxs=? where xqbm='"+xqbm+"'";
			ps3= conn.prepareStatement(ls_sql3);
			ps3.setInt(1,zxsl);
			ps3.executeUpdate();
		 	ps3.close();
	
			
       }
	   ps2.close();
	   rs2.close();
	  //求某小区的签单人数
		ls_sql2="select count(khbh) as sl from crm_khxx where xqbm='"+xqbm+"' ";
		ls_sql2+=wheresql;
		ps2= conn.prepareStatement(ls_sql2);
		rs2=ps2.executeQuery();
		if (rs2.next())
		{
			qys=rs2.getInt("sl");
			ls_sql3="update qh_tgglb set qys=? where xqbm='"+xqbm+"'";
			ps3= conn.prepareStatement(ls_sql3);
			ps3.setInt(1,qys);
			ps3.executeUpdate();
           ps3.close();

		} 

	   ps2.close();
	   rs2.close();
	  


	}
	ps.close();
	rs.close();


}
catch (Exception e) {
	out.print("生成咨询发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 

		if (ps2!= null) ps2.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps3!= null) ps3.close(); 

		if (conn != null) cf.close(conn); 

	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">请填写可控数量</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
	<!-- <td  width="12%">&nbsp;</td> -->
	<td  width="7%" align="center">小区编码</td>
	<td  width="7%" align="center">小区名称</td>
	<td  width="7%" align="center">咨询人数</td>
	<td  width="7%" align="center">签单人数</td>
	<td  width="7%" align="center">可控数</td>
</tr>
<%
//Connection conn  = null;
PreparedStatement ps5=null;
ResultSet rs5=null;
String ls_sql5=null;
String bgcolor=null;
int count=0;
int row=0;
String xqmc=null;
String xqbm2=null;
String szxs=null;
String sqys=null;
String kks=null;
try {
	conn=cf.getConnection();
	count=0;
	int i=0;
	ls_sql5="SELECT qh_tgglb.xqbm,dm_xqbm.xqmc,qh_tgglb.zxs,qh_tgglb.qys,qh_tgglb.kkjs  ";
	ls_sql5+=" FROM qh_tgglb,dm_xqbm ";
    ls_sql5+=" where  qh_tgglb.xqbm=dm_xqbm.xqbm(+)  and (zxs>0 or qys>0) ";    

	ps5= conn.prepareStatement(ls_sql5);
	rs5 =ps5.executeQuery(ls_sql5);
	while (rs5.next())
	{
        xqmc=cf.fillNull(rs5.getString("xqmc"));
		 xqbm2=cf.fillNull(rs5.getString("xqbm"));
		szxs=cf.fillNull(rs5.getString("zxs"));
		sqys=cf.fillNull(rs5.getString("qys"));
		kks=cf.fillNull(rs5.getString("kkjs"));
		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else
		{
			bgcolor="#FFFFFF";
		}
		i++;
    
%>
			
    <tr bgcolor="<%=bgcolor%>"> 
		<td align="center"> 
      <input name="xqbm" type="text" value="<%=xqbm2%>" size="6"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:dotted;border-color: #FFFFFF" readonly>       
	  </td>

	  <td align="center"> 
      <input name="xqmc" type="text" value="<%=xqmc%>" size="6"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:dotted;border-color: #FFFFFF" readonly>       
	  </td>
      <td align="center"><%=szxs%></td>
      
      <td align="center"><%=sqys%></td>

      <td align="center">
        <input name="kks" type="text" value="<%=kks%>" maxlength="10" size="10"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kks[<%=(row+1)%>])">
	  </td>
      
      
	</tr>
<%
			count++;
			row++;
	}
	ps5.close();
	rs5.close();

}
catch (Exception e) {
	out.print("可控数发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps5!= null) ps5.close(); 
		if (rs5!= null) rs5.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<tr bgcolor="#FFFFFF">
      <td colspan="14" > 
      <p align="center"> 
	  <!-- <input type=button value='全选' onclick="cf_checkAll(listform)"> -->
		  <input type=button value='保存' onclick="cf_submit(listform)" name="sjkgrq">
          &nbsp;&nbsp; 
		  <input type="reset" value='重输' >
          <input type="hidden" name="lrph" value=""> 
      </p>
      </td>
</tr>
</table>
</form> 


</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

var mark=1;
function cf_checkAll(formName)//转换字符串
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.sqxhbox.checked =false
		}
		else{
			formName.sqxhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.sqxhbox[i].checked =false
			}
			else{
				formName.sqxhbox[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}
function cf_delete(formName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( formName.khbhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.khbhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			formName.action="DeleteKhxm.jsp";
			formName.submit();
			return true;
		}
	}
} 
function cf_submit(formName)
{
	formName.action="SaveJj.jsp";
	formName.submit();
	return true;
} 
//-->
</script>




