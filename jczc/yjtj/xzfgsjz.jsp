<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));
String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String jzbz=request.getParameter("jzbz");
String sfjms=request.getParameter("sfjms");

String wheresql="";
String wheresql1="";


if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
{
	wheresql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  cw_qmjzmx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
}

wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>�ֹ�˾��װͳ��(<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>



<form method="post" action="" name="selectform" target="_blank">
        <input type="hidden" name="wheresql" value="<%=wheresql%>" >
        <input type="hidden" name="wheresql1" value="<%=wheresql1%>" >
        <input type="hidden" name="ssdqbm" value="<%=ssdqbm%>" >
        <input type="hidden" name="sjfw" value="<%=sjfw%>" >
        <input type="hidden" name="sjfw2" value="<%=sjfw2%>" >
        <input type="hidden" name="jzbz" value="<%=jzbz%>" >
        <input type="hidden" name="sfjms" value="<%=sfjms%>" >

<CENTER>
  <p>
    <%
if (dwbh.equals(""))
{
	%>
    <input type="button"  value="�ֹ�˾��ֵ-����" onClick="f_fgs(selectform,'bg')">
    </p>
  <p>
    <input type="button"  value="�ֹ�˾��ֵ-��ͼ" onClick="f_fgs(selectform,'bt')">
  </p>
  <p>
    <input type="button"  value="�ֹ�˾��ֵ-��״ͼ" onClick="f_fgs(selectform,'zzt')">
    <%

}	
%>
      </p>
</CENTER>

</form>



</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_fgs(FormName,lx)//����FormName:Form������
{
	if (lx=="bg")
	{
		FormName.action="fgscztjb.jsp";
	}
	else if (lx=="bt")
	{
		FormName.action="ViewFgsczBt.jsp";
	}
	else if (lx=="zzt")
	{
		FormName.action="ViewFgsczZzt.jsp";
	}

	FormName.submit();
	return true;
}



//-->
</SCRIPT>