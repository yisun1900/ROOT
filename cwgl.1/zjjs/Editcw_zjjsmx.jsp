<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>

<%
String jsjlh=request.getParameter("jsjlh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;

double bctcje=0;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT bctcje";
	ls_sql+=" FROM cw_zjjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bctcje=rs.getDouble("bctcje");
	}
	rs.close();
	ps.close();
%>

<form method="post" action="" name="selectform" target="_back">
  <div align="center"><b>质检结算－－增减其它费用（结算记录号：<%=jsjlh%>）</b></div>
        
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" >
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="7%" ><b>项目编码</b></td>
      <td width="21%" ><b>项目名称</b></td>
      <td width="12%" ><b>增减百分比</b></td>
      <td width="12%" ><b>增减金额</b></td>
      <td width="48%" ><b>备注</b></td>
	
	</tr>
    <%

	String sjsxmbm=null;
	String sjsxmmc=null;
	double zjbfb=0;
	double zjje=0;
	String bz=null;
	String bgcolor="";

	String zjbfbstr="";
	String zjjestr="";

	ls_sql=" SELECT sjsxmbm,cw_zjjszjfy.sjsxmmc,cw_zjqtfymx.zjbfb,cw_zjqtfymx.zjje,cw_zjqtfymx.bz";
	ls_sql+=" FROM cw_zjjszjfy,cw_zjqtfymx";
	ls_sql+=" where cw_zjjszjfy.sjsxmmc=cw_zjqtfymx.sjsxmmc(+) and cw_zjqtfymx.jsjlh(+)='"+jsjlh+"' and cw_zjqtfymx.khbh(+)='"+khbh+"'";
	ls_sql+=" order by sjsxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjsxmbm=cf.fillNull(rs.getString("sjsxmbm"));
		sjsxmmc=cf.fillNull(rs.getString("sjsxmmc"));
		zjbfb=rs.getDouble("zjbfb");
		zjje=rs.getDouble("zjje");
		bz=cf.fillNull(rs.getString("bz"));

		if (zjbfb==0)
		{
			zjbfbstr="";
		}
		else{
			zjbfbstr=""+zjbfb;
		}
		if (zjje==0)
		{
			zjjestr="";
		}
		else{
			zjjestr=""+zjje;
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

	%> 
    <tr bgcolor="<%=bgcolor%>" align="center" > 
      <td > 
          <%=sjsxmbm%>
		  <input type="hidden" name="sjsxmbm" value="<%=sjsxmbm%>">
      </td>
      <td > 
        <input type="text" name="sjsxmmc" size="26" maxlength="50" value="<%=sjsxmmc%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
      </td>
      <td > 
        <input type="text" name="zjbfb" size="8" maxlength="16" value="<%=zjbfbstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zjbfb[<%=row%>])" onChange="f_js(selectform)">
		%
      </td>
      <td > 
        <input type="text" name="zjje" size="12" maxlength="16" value="<%=zjjestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  readonly>
      </td>
      <td > 
        <input type="text" name="bz" size="60" maxlength="200" value="<%=bz%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=row%>])">
      </td>
	</tr>
    <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    <tr bgcolor="CCCCCC" align="center"> 
      <td colspan="18"> 
		  <input type="hidden" name="jsjlh" value="<%=jsjlh%>">
		  <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="button"  value=" 保 存 " onClick="f_do(selectform)">
      </td>
    </tr>
  </table>
		</form>
		</body>
		</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_js(FormName)//参数FormName:Form的名称
{

	if (<%=row%>>1)
	{
		for (var i=0;i<<%=row%> ;i++ )
		{
			FormName.zjje[i].value=<%=bctcje%>/100.0*FormName.zjbfb[i].value;
			FormName.zjje[i].value=round(FormName.zjje[i].value,2);
			if (FormName.zjje[i].value==0)
			{
				FormName.zjje[i].value="";
			}
		}
	}
	else if (<%=row%>==1)
	{
		FormName.zjje.value=<%=bctcje%>/100.0*FormName.zjbfb.value;
		FormName.zjje.value=round(FormName.zjje.value,2);
	}


}


function f_do(FormName)//参数FormName:Form的名称
{
	f_js(FormName);
/*
	var mark=0;
	if (<%=row%>>1)
	{
		for (var i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.xjgsxsj[i])!="") 
			{
				if(!(isDatetime(FormName.xjgsxsj[i], "新价格生效时间"))) 
				{
					return false;
				}
				mark++;
			}
			if(	javaTrim(FormName.cxkssj[i])!="") 
			{
				if(!(isDatetime(FormName.cxkssj[i], "促销开始时间"))) 
				{
					return false;
				}
			}
			if(	javaTrim(FormName.cxjzsj[i])!="") 
			{
				if(!(isDatetime(FormName.cxjzsj[i], "促销结束时间"))) 
				{
					return false;
				}
			}
		}
	}
	else if (<%=row%>==1)
	{
		if(	javaTrim(FormName.xjgsxsj)!="") 
		{
			if(!(isDatetime(FormName.xjgsxsj, "新价格生效时间"))) 
			{
				return false;
			}
			mark++;
		}
		if(	javaTrim(FormName.cxkssj)!="") 
		{
			if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) 
			{
				return false;
			}
		}
		if(	javaTrim(FormName.cxjzsj)!="") 
		{
			if(!(isDatetime(FormName.cxjzsj, "促销结束时间"))) 
			{
				return false;
			}
		}
	}

	if (mark==0)
	{
		alert("错误！必须录入【新价格生效时间】，否则修改无效");
		return;
	}
*/
	FormName.action="SaveEditcw_zjjsmx.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>