<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String px=request.getParameter("px");

	String fgs=request.getParameter("fgs");
	String wheresql="";

	if (!(fgs.equals("")))
	{
		wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";



	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String cldlmc=null;
	String khbh=null;
	String hth=null;
	String khxm=null;
	double qye=0;
	double zqye=0;
	double hjjm=0;//�ϼƼ���
	double zhjjm=0;//�ܺϼƼ���
	double[] ylqje=new double[100];
	double[] sjje=new double[100];
	double[] jme=new double[100];
	double[] zjjme=new double[100];
	int[] jms=new int[100];//������
	int zjms=0;//�ܼ�����
	String[] cldlmcStr=new String[100];
	int row=0;
	int numOne=0;//������1
	int numTow=0;//������2

try {
	conn=cf.getConnection();

	ls_sql="select cldlmc";
	ls_sql+=" from cl_cldlbm ";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���ļ���ͳ��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV">
      <table border="1" width="180%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
        <tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR"> 
          <td  width="3%"  class="STYLE1">��ͬ��</td>
          <td  width="5%" class="STYLE1">�ͻ�����</td>
          <td  width="4%" class="STYLE2">��ͬ���</td>
<%//���ݸ��Ĵ���Ķ�����������
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");	
			cldlmcStr[numOne]=cldlmc;
			numOne++;
%>
          <td  width="4%" class="STYLE2"><%=cldlmc%></td>

<%
	}
	numOne--;
	rs.close();
	ps.close();
%>
          <td  width="4%" class="STYLE2">�ϼ�</td>
        </tr>
<%
//��ʾ��ͬ�š��ͻ�������ǩԼ��		
	ls_sql=" select distinct crm_khxx.khbh khbh,hth,khxm,crm_khxx.qye qye";
	ls_sql+=" from cl_djj,crm_khxx ";
	ls_sql+=" where cl_djj.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hjjm=0;
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		qye=rs.getDouble("qye");
		zqye+=qye;
//�����ÿ���ͻ�ÿ�����ϴ�������
		for(numTow=0;numTow<=numOne;numTow++)
		{
			ls_sql="select ylqje,sjje";
			ls_sql+=" from cl_djjflmx ";
			ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cldlmcStr[numTow]+"' ";
			ps1 = conn.prepareStatement(ls_sql);
			rs1 = ps1.executeQuery();
			if (rs1.next())
			{
				ylqje[numTow]=rs1.getDouble("ylqje");
				sjje[numTow]=rs1.getDouble("sjje");
				jme[numTow]=sjje[numTow]-ylqje[numTow];//��������������
			}
			rs1.close();
			ps1.close();

			if(jme[numTow]<0)
			{
				hjjm+=jme[numTow];//�ÿͻ��ϼƼ����
				zhjjm+=jme[numTow];//�ܼƼ����
			}
		}
%>
         <tr align="center" >
          <td class="STYLE3"><%=hth%></td>
          <td class="STYLE3"><%=khxm%></td>
          <td align="right" class="STYLE4"><%=cf.formatDouble((int)qye)%></td>
<%
		  for(numTow=0;numTow<=numOne;numTow++)
		 {
			if(jme[numTow]<0)
			{%>
            <td align="right" class="STYLE4"><%=cf.formatDouble((int)(-jme[numTow]))%></td>
			<%
			zjjme[numTow]+=(-jme[numTow]);
			jms[numTow]++;//������⹤����
			zjms++;//�ܼƼ��⹤����
			}
			else
			{%>
            <td align="right" class="STYLE4"><font color="#FF0000">0</font></td>
			<%}
		 }
%>         
		<td align="right" class="STYLE4"><%=cf.formatDouble((int)(-hjjm))%></td>
        </tr>
<%
	}
	rs.close();
	ps.close();
%>
         <tr align="center" >
          <td class="STYLE3"><B>�ϼ�</B></td>
          <td class="STYLE3">&nbsp;</td>
          <td align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
<%
		  for(numTow=0;numTow<=numOne;numTow++)
		 {
			if(jme[numTow]<0)
			{%>
            <td align="right" class="STYLE4"><B><%=cf.formatDouble((int)(zjjme[numTow]))%></B></td>
			<%
			}
			else
			{%>
            <td align="right" class="STYLE4"><font color="#FF0000">0</font></td>
			<%}
			
		 }
%>         
		<td align="right" class="STYLE4"><B><%=cf.formatDouble((int)(-zhjjm))%></B></td>
        </tr>

         <tr align="center" >
          <td colspan="2" class="STYLE3"><B>���⹤����</B></td>
          <td class="STYLE4">&nbsp;</td>
<%
		  for(numTow=0;numTow<=numOne;numTow++)
		 {%>
            <td class="STYLE4"><B><%=jms[numTow]%></B></td>	
		 <%}
%>         
		<td class="STYLE4"><B><%=zjms%></B></td>
        </tr>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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

</table>
</body>
</html>