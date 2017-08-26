<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String nian=cf.today("YYYY");
double khcz1=0;
double khcz2=0;
double khcz3=0;

double mbcz1=0;
double mbcz2=0;
double mbcz3=0;

try {
	conn=cf.getConnection();


%>


<form method="post" action="SaveInsertCw_dmkhcz.jsp" name="insertform" >
<div align="center">录入月考核产值</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单位</td>
      <td width="35%"> 
	<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	%> 
	</select>
      </td>
      <td align="right" width="15%">年</td>
      <td width="35%"> 
        <input type="text" name="nian" value="<%=nian%>" size="20" maxlength="4" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入人</td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%">录入时间</td>
      <td width="35%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4">
        <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
          <tr bgcolor="#CCCCCC"  align="center">
            <td  width="10%">&nbsp;</td>
            <td  width="9%">&nbsp;</td>
            <td  width="21%">考核产值</td>
            <td  width="9%">&nbsp;</td>
            <td  width="21%">考核产值</td>
            <td  width="9%">&nbsp;</td>
            <td  width="21%">考核产值</td>
          </tr>
          <%	
		khcz1=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='01'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz1=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz2=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='02'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz2=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz3=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='03'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz3=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="#FFFFFF" align="center">
            <td width="9%">第一季度</td>
            <td width="9%">01月 
              <input type="hidden" name="yue" value="01" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">02月 
              <input type="hidden" name="yue" value="02" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">03月 
              <input type="hidden" name="yue" value="03" >
            </td>
            <td width="22%"> 
              <input type="text" name="khcz" value="<%=khcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>
          <%	
		khcz1=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='04'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz1=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz2=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='05'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz2=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz3=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='06'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz3=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="E8E8FF" align="center">
            <td width="9%">第二季度</td>
            <td width="9%">04月 
              <input type="hidden" name="yue" value="04" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">05月 
              <input type="hidden" name="yue" value="05" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">06月 
              <input type="hidden" name="yue" value="06" >
            </td>
            <td width="22%"> 
              <input type="text" name="khcz" value="<%=khcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>
          <%	
		khcz1=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='07'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz1=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz2=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='08'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz2=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz3=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='09'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz3=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="#FFFFFF" align="center">
            <td width="9%">第三季度</td>
            <td width="9%">07月 
              <input type="hidden" name="yue" value="07" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">08月 
              <input type="hidden" name="yue" value="08" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">09月 
              <input type="hidden" name="yue" value="09" >
            </td>
            <td width="22%"> 
              <input type="text" name="khcz" value="<%=khcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>
          <%	
		khcz1=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='10'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz1=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz2=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='11'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz2=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		khcz3=0;
		ls_sql="SELECT khcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='12'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khcz3=rs.getDouble("khcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="E8E8FF" align="center">
            <td width="9%">第四季度</td>
            <td width="9%">10月 
              <input type="hidden" name="yue" value="10" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">11月 
              <input type="hidden" name="yue" value="11" >
            </td>
            <td width="21%"> 
              <input type="text" name="khcz" value="<%=khcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">12月 
              <input type="hidden" name="yue" value="12" >
            </td>
            <td width="22%"> 
              <input type="text" name="khcz" value="<%=khcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>

        </table>

		
		
		
	<P>	
		
		
        <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
          <tr bgcolor="#CCCCCC"  align="center">
            <td  width="10%">&nbsp;</td>
            <td  width="9%">&nbsp;</td>
            <td  width="21%">目标产值</td>
            <td  width="9%">&nbsp;</td>
            <td  width="21%">目标产值</td>
            <td  width="9%">&nbsp;</td>
            <td  width="21%">目标产值</td>
          </tr>
          <%	
		mbcz1=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='01'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz1=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz2=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='02'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz2=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz3=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='03'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz3=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="#FFFFFF" align="center">
            <td width="9%">第一季度</td>
            <td width="9%">01月 
              <input type="hidden" name="mbyue" value="01" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">02月 
              <input type="hidden" name="mbyue" value="02" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">03月 
              <input type="hidden" name="mbyue" value="03" >
            </td>
            <td width="22%"> 
              <input type="text" name="mbcz" value="<%=mbcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>
          <%	
		mbcz1=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='04'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz1=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz2=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='05'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz2=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz3=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='06'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz3=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="E8E8FF" align="center">
            <td width="9%">第二季度</td>
            <td width="9%">04月 
              <input type="hidden" name="mbyue" value="04" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">05月 
              <input type="hidden" name="mbyue" value="05" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">06月 
              <input type="hidden" name="mbyue" value="06" >
            </td>
            <td width="22%"> 
              <input type="text" name="mbcz" value="<%=mbcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>
          <%	
		mbcz1=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='07'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz1=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz2=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='08'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz2=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz3=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='09'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz3=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="#FFFFFF" align="center">
            <td width="9%">第三季度</td>
            <td width="9%">07月 
              <input type="hidden" name="mbyue" value="07" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">08月 
              <input type="hidden" name="mbyue" value="08" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">09月 
              <input type="hidden" name="mbyue" value="09" >
            </td>
            <td width="22%"> 
              <input type="text" name="mbcz" value="<%=mbcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>
          <%	
		mbcz1=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='10'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz1=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz2=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='11'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz2=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		mbcz3=0;
		ls_sql="SELECT mbcz";
		ls_sql+=" FROM cw_dmkhcz";
		ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='12'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mbcz3=rs.getDouble("mbcz");
		}
		rs.close();
		ps.close();

		%> 
          <tr bgcolor="E8E8FF" align="center">
            <td width="9%">第四季度</td>
            <td width="9%">10月 
              <input type="hidden" name="mbyue" value="10" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz1%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">11月 
              <input type="hidden" name="mbyue" value="11" >
            </td>
            <td width="21%"> 
              <input type="text" name="mbcz" value="<%=mbcz2%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
            <td width="9%">12月 
              <input type="hidden" name="mbyue" value="12" >
            </td>
            <td width="22%"> 
              <input type="text" name="mbcz" value="<%=mbcz3%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
            </td>
          </tr>

        </table>
		
		
		
		
		
		
		
		
		
		
		</td>
    </tr>

<%
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    
    
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
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
