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
  <B>Ͷ����ϸ��
  <BR>(Ͷ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
      <table border="1" width="150%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
        <tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR"> 
          <td  width="6%" class="STYLE1">���</td>
          <td  width="6%" class="STYLE1">�ֹ�˾</td>
          <td  width="7%" class="STYLE1">��ͬ��</td>
          <td  width="6%" class="STYLE1">�ͻ�����</td>
          <td  width="6%" class="STYLE2">����</td>
          <td  width="8%" class="STYLE2">ǩԼ����</td>
          <td  width="8%" class="STYLE2">��������</td>
          <td  width="8%" class="STYLE2">Ͷ��ʱ��</td>
          <td  width="6%" class="STYLE2">���β���</td>
          <td  width="10%" class="STYLE2">��Ҫԭ��</td>
          <td  width="8%" class="STYLE2">����ʱ��</td>
          <td  width="13%" class="STYLE2">�������</td>
          <td  width="6%" class="STYLE2">������</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();
	String tsjlh=null;
	String fgsmc=null;
	String hth=null;
	String khxm=null;
	String dm=null;
//	String sjs=null;
	String zrbm=null;
	String qyrq=null;
	String sjjgrq=null;
	String slsj=null;
	String tsxlmc=null;
	String tsyymc=null;
	String clsj=null;
	String clqk=null;
	String clzt=null;
	ls_sql="select crm_tsjl.tsjlh tsjlh,a.dwmc fgsmc,hth,khxm,b.dwmc dm,qyrq,slsj,sjjgrq";
	ls_sql+=" from crm_tsjl,sq_dwxx a,sq_dwxx b,crm_khxx ";
	ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.fgsbh=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+) and crm_tsjl.lx='1'  ";
	ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" order by crm_tsjl.slsj desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		fgsmc=rs.getString("fgsmc");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		dm=rs.getString("dm");
//		sjs=rs.getString("sjs");
//		sgdmc=rs.getString("sgdmc");
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));


		tsxlmc="<font color=red>û����������</font>";
		tsyymc="&nbsp;";
		clsj="<font color=red>û����������</font>";
		clqk="<font color=red>û����������</font>";
//		clr=rs1.getString("clr");
		clzt="<font color=red>û����������</font>";
		zrbm="<font color=red>û����������</font>";



		ls_sql="select tsxlmc,tsyymc,clsj,clqk,DECODE(clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,sq_dwxx.dwmc zrbm ";
		ls_sql+=" from crm_tsbm,dm_tsxlbm,dm_tsyybm,sq_dwxx ";
		ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+) and  crm_tsbm.tsjlh='"+tsjlh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
		tsxlmc=rs1.getString("tsxlmc");
		tsyymc=rs1.getString("tsyymc");
		clsj=cf.fillHtml(rs1.getDate("clsj"));
		clqk=rs1.getString("clqk");
//		clr=rs1.getString("clr");
		clzt=rs1.getString("clzt");
		zrbm=rs1.getString("zrbm");
		}
		rs1.close();
		ps1.close();

//		if(sgdmc==null){
//		sgdmc="<font color=red>��Ϣ��д��ȫ</font>";
//		}
		if(hth==null){
		hth="<font color=red>�˲�ÿͻ�</font>";
		}
//		if(sjs==null){
//		sjs="<font color=red>��Ϣ��д��ȫ</font>";
//		}
		if(tsxlmc==null){
		tsxlmc="&nbsp;";
		}
		if(tsyymc==null){
		tsyymc="&nbsp;";
		}
		if(clqk==null){
		clqk="&nbsp;";
		}
//		if(clr==null){
//		clr="&nbsp;";
//		}
%>
		<tr align="center">
          <td  class="STYLE3"><%=tsjlh%></td>
          <td  class="STYLE3"><%=fgsmc%></td>
          <td  class="STYLE3"><%=hth%></td>
          <td  class="STYLE3"><%=khxm%></td>
          <td  class="STYLE4"><%=dm%></td>
          <td  class="STYLE4"><%=qyrq%></td>
          <td  class="STYLE4"><%=sjjgrq%></td>
          <td  class="STYLE4"><%=slsj%></td>
          <td  class="STYLE4"><%=zrbm%></td>
          <td  class="STYLE4"><%="<font color=red>"+tsxlmc+"</font>:"+tsyymc%></td>
          <td  class="STYLE4"><%=clsj%></td>
          <td  class="STYLE4"><%=clqk%></td>
          <td  class="STYLE4"><%=clzt%></td>
        </tr>
<%
	}
	ps.close();
	rs.close();

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
  </DIV>
</body>
</html>
