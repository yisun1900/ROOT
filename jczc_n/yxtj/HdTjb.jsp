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
  <B>�ص�ͳ��
  <BR>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV">
<table width="100%" border="0" style='FONT-SIZE: 14px' class="STYLE_TAB">
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
        <tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR"> 
          <td  width="6%" class="STYLE2">����</td>
          <td  width="12%" class="STYLE2">�ص���</td>
          <td  width="9%" class="STYLE2">�ص�����</td>
          <td  width="10%" class="STYLE2">�ص��ܽ��</td>
          <td  width="8%" class="STYLE2">�ۿ���</td>
          <td  width="9%" class="STYLE2">ƽ������</td>
          <td  width="8%" class="STYLE2">��Ʒ�</td>
          <td  width="34%" class="STYLE2">�ص��ܽ��</td>
        </tr>
<%
int maxsl=0;
int maxsl1=0;
int sjssl=0;//���ʦ�ص�����
int sgdsl=0;//ʩ���ӻص�����
int qtsl=0;//�����ص�����
double maxje=0;
String dwmc=null;
String sgd=null;
double wdzgce=0;//δ���۹��̶�
double zkl=0;//�ۿ���

int allsl=0;
int allje=0;
int allbzsl=0;
double sjf=0;
double allsjf=0;
double sjssjf=0;//���ʦ�ص���Ʒ�
double sgdsjf=0;//ʩ���ӻص���Ʒ�
double qtsjf=0;//���ʦ�ص���Ʒ�
double allwdzgce=0;//δ���۹��̶�
double sjswdzgce=0;//���ʦδ���۹��̶�
double sgdwdzgce=0;//ʩ����δ���۹��̶�
double allzkl=0;//�ۿ���

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();


	//��ȡ���ֵ   ty �ѻص���־ =3 �ĳ� !=1
	ls_sql="select NVL(max(count(*)),0)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz!='1' and zt='2'";//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص�
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" group by hdr";
	maxsl1=Integer.parseInt(cf.executeQuery(ls_sql));
	if (maxsl1==0)
	{
		return;
	}

	//��ȡ�������   ty �ѻص���־ =3 �ĳ� !=1
	ls_sql="select count(*)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz!='1' and zt='2'";//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص�
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	maxsl=Integer.parseInt(cf.executeQuery(ls_sql));

	//��ȡ���ʦ�ص����ֵ ty
	ls_sql="select count(*)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='2' and zt='2'";//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص�
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	sjssl=Integer.parseInt(cf.executeQuery(ls_sql));
	//��ȡʩ���ӻص����ֵ ty
	ls_sql="select count(*)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='3' and zt='2'";//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص�
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	sgdsl=Integer.parseInt(cf.executeQuery(ls_sql));

	qtsl=maxsl-sgdsl-sjssl;//�����ص��������ڻص�������ȥʩ���ӻص����������ʦ�ص���
//�ص��ܽ�� ty �ѻص���־ =3 �ĳ� !=1
	ls_sql="select sum(qye) qye,sum(wdzgce) wdzgce";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz!='1' and zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxje=rs.getDouble("qye");
		allwdzgce=rs.getDouble("wdzgce");

	}
	rs.close();
	ps.close();

	int sjsje=0;
//���ʦ�ص��ܽ�� 
	ls_sql="select sum(qye) qye,sum(wdzgce) wdzgce,sum(sjf) sjf";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='2' and zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsje=rs.getInt("qye");
		sjswdzgce=rs.getDouble("wdzgce");
		sjssjf=rs.getDouble("sjf");
	}
	rs.close();
	ps.close();

	int sgdje=0;
//ʩ���ӻص��ܽ�� 
	ls_sql="select sum(qye) qye,sum(wdzgce) wdzgce,sum(sjf) sjf";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz='3' and zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgdje=rs.getInt("qye");
		sgdwdzgce=rs.getDouble("wdzgce");
		sgdsjf=rs.getDouble("sjf");
	}
	rs.close();
	ps.close();

	int pm=0;
	int oldpm=0;
	int sl=0;
	int je=0;
	int qtje=0;
	int bzsl=0;
	int pjje=0;
	int sjspjje=0;//���ʦ�ص�ƽ���۸�
	int sgdpjje=0;//ʩ���ӻص�ƽ���۸�
	int qtpjje=0;//�����ص�ƽ���۸�

//ty �ѻص���־ =3 �ĳ� !=1
	ls_sql=" select hdr,count(*) sl,sum(qye) je,sum(sjf) sjf,sum(wdzgce) wdzgce";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and hdbz!='1' and zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	ls_sql+=" group by hdr";


	ls_sql+=" order by sum(qye) desc";
	//out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dwmc=rs.getString("hdr");
		sl=rs.getInt(2);
		je=rs.getInt(3);
		sjf=rs.getDouble("sjf");
		wdzgce=rs.getDouble("wdzgce");


		
		allsl+=sl;
		allje+=je;
		allsjf+=sjf;
		if (sl!=0)
		{
			pjje=je/sl;
		}
		else{
			pjje=0;
		}
//ty �����ۿ���
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=je*10/wdzgce;
		}
		
		if (oldpm!=je)
		{
			pm++;
			oldpm=je;
		}

		if (pm%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

%>
          <td><%=pm%></td>
          <td><%=dwmc%></td>
          <td align="right"><%=sl%></td>
          <td align="right"><%=cf.formatDouble(je)%></td>
		  <td  align="right"><%=cf.round(zkl,1)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
          <td align="right"><%=cf.formatDouble(sjf)%></td>
          <td align="left"><A HREF="ViewHdtj.jsp?hdr=<%=dwmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=je*200/maxje%>" height="14"></A></td>
        </tr>
<%

	}
	ps.close();
	rs.close();


	if (allsl!=0)
	{
		pjje=allje/allsl;
	}
	else{
		pjje=0;
	}
//���ʦƽ�����
	if (sjssl!=0)
	{
		sjspjje=sjsje/sjssl;
	}
	else{
		sjspjje=0;
	}
//ʩ����ƽ�����
	if (sgdsl!=0)
	{
		sgdpjje=sgdje/sgdsl;
	}
	else{
		sgdpjje=0;
	}

//�ۿ���
	if (allwdzgce==0)
	{
		allzkl=0;
	}
	else{
		allzkl=allje*10/allwdzgce;
	}
double sjszkl=0;//�ۿ���
//���ʦ�ص��ۿ���
	if (sjswdzgce==0)
	{
		sjszkl=0;
	}
	else{
		sjszkl=sjsje*10/sjswdzgce;
	}
double sgdzkl=0;//�ۿ���
//ʩ���ӻص��ۿ���
	if (sgdwdzgce==0)
	{
		sgdzkl=0;
	}
	else{
		sgdzkl=sgdje*10/sgdwdzgce;
	}
double qtwdzgce=0;
	qtje=allje-sjsje-sgdje;
	qtsjf=allsjf-sjssjf-sgdsjf;
	qtwdzgce=allwdzgce-sjswdzgce-sgdwdzgce;
//����ƽ�����
	if (qtsl!=0)
	{
		qtpjje=qtje/qtsl;
	}
	else{
		qtpjje=0;
	}

double qtzkl=0;//�ۿ���
//�����ص��ۿ���
	if (qtwdzgce==0)
	{
		qtzkl=0;
	}
	else{
		qtzkl=qtje*10/qtwdzgce;
	}


%>

        <tr align="center" >
          <td>�ϼ�</td>
          <td>&nbsp;</td>
          <td align="right"><%=allsl%></td>
          <td align="right"><%=cf.formatDouble(allje)%></td>
		  <td  align="right"><%=cf.round(allzkl,1)%></td>
          <td align="right"><%=cf.formatDouble(pjje)%></td>
          <td align="right"><%=cf.formatDouble(allsjf)%></td>
          <td align="left">&nbsp;</td>
        </tr>

        <tr align="center" >
          <td colspan="2">���ʦ�ص��ϼ�</td>
          <td align="right"><%=sjssl%></td>
          <td align="right"><%=cf.formatDouble(sjsje)%></td>
		  <td align="right"><%=cf.round(sjszkl,1)%></td>
          <td align="right"><%=cf.formatDouble(sjspjje)%></td>
          <td align="right"><%=cf.formatDouble(sjssjf)%></td>
          <td align="left">&nbsp;</td>
        </tr>

        <tr align="center" >
          <td colspan="2">ʩ���ӻص��ϼ�</td>
          <td align="right"><%=sgdsl%></td>
          <td align="right"><%=cf.formatDouble(sgdje)%></td>
		  <td  align="right"><%=cf.round(sgdzkl,1)%></td>
          <td align="right"><%=cf.formatDouble(sgdpjje)%></td>
          <td align="right"><%=cf.formatDouble(sgdsjf)%></td>
          <td align="left">&nbsp;</td>
        </tr>

        <tr align="center" >
          <td colspan="2">�����ϼ�</td>
          <td align="right"><%=qtsl%></td>
          <td align="right"><%=cf.formatDouble(qtje)%></td>
		  <td  align="right"><%=cf.round(qtzkl,1)%></td>
          <td align="right"><%=cf.formatDouble(qtpjje)%></td>
          <td align="right"><%=cf.formatDouble(qtsjf)%></td>
          <td align="left">&nbsp;</td>
        </tr>

<%

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e+ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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
    </td>
  </tr>
</table>
</DIV>
</body>
</html>