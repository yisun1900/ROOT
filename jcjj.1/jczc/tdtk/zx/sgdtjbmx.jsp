<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");

	String txlx=cf.GB2Uni(request.getParameter("txlx"));

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>施工队增项退款明细<BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> 
  <BR> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td> 
	<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="6%">施工队</td>
          <td  width="7%">客户姓名</td>
          <td  width="6%">设计师</td>
          <td  width="10%">增项部门</td>
          <td  width="8%">退款时间</td>
          <td  width="8%">实退金额</td>
          <td  width="10%">原因分类</td>
          <td  width="18%">退款原因</td>
          <td  width="20%">备注</td>
        </tr>
<%	
	int[] mark={3,1,1,1,1,2,4,4,4};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示

	ls_sql="SELECT sgdmc sgd,khxm,sjs,a.dwmc zd,lrsj,crm_zjxdj.zjje,zjxyymc,zjxyysm,crm_zjxdj.bz  ";
	ls_sql+=" FROM crm_zjxdj,dm_zjxyybm,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_zjxdj.zjxyybm=dm_zjxyybm.zjxyybm and crm_zjxdj.sgd=sq_sgd.sgd and crm_zjxdj.dwbh=a.dwbh(+)";
	ls_sql+=" and crm_zjxdj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zjxdj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zjxdj.fylxbm='01'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zjxdj.sgd in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}

	ls_sql+=" order by sgd,zjxyymc";

	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);

%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
