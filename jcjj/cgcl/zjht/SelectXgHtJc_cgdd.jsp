<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('F0','F1','F2') order by ssdw,dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String dlxmzy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='10'");
if (dlxmzy==null)
{
	dlxmzy="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">橱柜订单处理--修改合同</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_cgddXgHtList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">所属公司</div>              </td>
              <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="18%"> 
                <div align="right">录入部门</div>              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">订单编号</div>              </td>
              <td width="32%"> 
                <input type="text" name="ddbh" size="20" maxlength="9" >              </td>
              <td width="18%"> 
                <div align="right">客户编号</div>              </td>
              <td width="32%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">合同号</div>              </td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
              <td width="18%"> 
                <div align="right">客户姓名</div>              </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">房屋地址</div>              </td>
              <td width="32%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>              </td>
              <td width="32%"> 
                <input type="text" name="lxfs" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">驻店家居顾问</td>
              <td width="32%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='08'","");
%> 
                </select>              </td>
              <td width="18%" align="right">展厅家居顾问</td>
              <td width="32%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='08'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">项目专员</div>              </td>
              <td width="32%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (dlxmzy.equals(""))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' and yhmc='"+dlxmzy+"'",dlxmzy);
	}
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">家居设计师&nbsp;</div>              </td>
              <td width="32%"> 
                <input type="text" name="cgsjs" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否需派设计师</td>
              <td><input type="radio" name="sfpsjs" value="1">
                是
                <input type="radio" name="sfpsjs" value="2">
                否 </td>
              <td align="right">橱柜工厂</td>
              <td><select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">                处理状态</td>
              <td width="32%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <option value="13">签订合同</option>
                </select>              </td>
              <td width="18%" align="right">                客户类型</td>
              <td width="32%"><input type="radio" name="khlx" value="2">
                家装客户
                  <input type="radio" name="khlx" value="4">
              非家装客户 </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
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

