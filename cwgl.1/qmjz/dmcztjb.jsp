<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String jzrq=request.getParameter("jzrq");
String dwbh=request.getParameter("dwbh");

String sjfw=jzrq.substring(0,8)+"01";
String sjfw2=jzrq;

String wheresql="";
String wheresql1=" and ssfgs='"+dwbh+"'";


wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
wheresql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
String ls_sql=null;


try {
	conn=cf.getConnection();

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
  <B>�����תҵ��ͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" width="120%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">����</td>
  <td  width="9%" class="STYLE1">�ֹ�˾</td>
  <td  width="13%" class="STYLE1">����</td>
  <td  width="6%" class="STYLE2">ǩԼ��</td>
  <td  width="10%" class="STYLE2">��ǰ��ͬ��</td>
  <td  width="10%" class="STYLE2">�ۺ��ͬ��</td>
  <td  width="8%" class="STYLE2">�˵���</td>
  <td  width="10%" class="STYLE2">ǩ��-�˵�</td>
  <td  width="5%" class="STYLE2">ǩԼ������</td>
  <td  width="5%" class="STYLE2">ǩԼ�����</td>
  <td  width="5%" class="STYLE2">ƽ������</td>
  <td  width="5%" class="STYLE2">ƽ�׾���</td>
  <td  width="7%" class="STYLE2">��Ʒ�</td>
  <td  width="4%" class="STYLE2">�ۿ���</td>
</tr>
<%
	int allqys=0;
	double allwdzgce=0;
	double allqye=0;
	double allzhzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	long allfwmj=0;

	String getfgsbh=null;
	String getfgsmc=null;
	String getdwbh=null;
	String getdwmc=null;
	String oldfgsmc="";

	int qys=0;
	double qye=0;
	double wdzgce=0;
	double zhzjxje=0;
	long fwmj=0;
	double sjf=0;

	int pjde=0;
	int pmjj=0;
	double zkl=0;
	double qysbfb=0;
	double qyebfb=0;

	double tdje=0;//�˵���
	double alltdje=0;

	double yjje=0;//ҵ��
	double allyjje=0;

	int row=0;


	//��װ�ܿͻ���ǩԼ��
	ls_sql="SELECT count(*),sum(crm_khxx.wdzgce),sum(crm_khxx.qye),sum(NVL(crm_khxx.zhzjxje,0)),sum(NVL(crm_khxx.zhzjxje,0)+crm_khxx.qye),sum(crm_khxx.sjf+NVL(crm_khxx.sjhtsjf,0)),sum(crm_khxx.fwmj)";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allwdzgce=rs.getDouble(2);
		allqye=rs.getDouble(3);
		allzhzjxje=rs.getDouble(4);
		allzjhze=rs.getDouble(5);
		allsjf=rs.getDouble(6);
		allfwmj=rs.getLong(7);
	}
	rs.close();
	ps.close();


	//��û�пͻ�ʱ�����ء�
	if(allqys==0)
	{
		return;
	}
	if(allqye==0)
	{
		return;
	}


	ls_sql=" SELECT fgsbh,dwbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,count(*) qys,sum(crm_khxx.qye) qye,sum(crm_khxx.wdzgce) wdzgce,sum(crm_khxx.zhzjxje) zhzjxje,sum(crm_khxx.sjf+NVL(crm_khxx.sjhtsjf,0)) sjf,sum(crm_khxx.fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT ssfgs,dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F2' and cxbz='N'";
    ls_sql+=" and ssfgs='"+dwbh+"'";
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,dwbh";
	ls_sql+=" order by qye desc,fgsbh,dwbh";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getdwbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		String cxbz="";
		String kdsj="";
		String gdsj="";
		ls_sql="SELECT dwmc,kdsj,gdsj,cxbz";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getdwmc=rs1.getString("dwmc");
			cxbz=rs1.getString("cxbz");
			kdsj=cf.fillNull(rs1.getDate("kdsj"));
			gdsj=cf.fillNull(rs1.getDate("gdsj"));
		}
		rs1.close();
		ps1.close();

		if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
		{
			getdwmc="<font color=\"#FF0033\">"+getdwmc+"("+kdsj+"��"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				getdwmc=getdwmc+"(����:"+kdsj+")";
			}
		}

		//�˵�
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx";
		ls_sql+=" where cw_qmjzmx.zt in ('3')";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;



		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}

		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}


		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		
		row++;

		if (getfgsmc.equals(oldfgsmc))
		{
			getfgsmc="ͬ��";;
		}
		else{
			oldfgsmc=getfgsmc;
		}



		%>
		<tr align="center">
			<td  class="STYLE3"><A HREF="ViewDmcz.jsp?jzrq=<%=jzrq%>&dwbh=<%=getdwbh%>" target="_blank"><%=row%></A></td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  class="STYLE3"><%=getdwmc%></td>
			<td  align="right" class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(qye)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(tdje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(yjje)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
		</tr>
		<%	

	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">�ܼ�</td>
	<td  class="STYLE3">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allyjje)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
</tr>
</table>
</DIV>


<BR>
<CENTER >
  <B>�ֹ�˾��ֵͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>


<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px'  >
<tr bgcolor="#CCCCCC"  align="center"  >
  <td  width="3%" >����</td>
  <td  width="9%" >�ֹ�˾</td>
  <td  width="6%" >ǩԼ��</td>
  <td  width="10%" >��ǰ���</td>
  <td  width="10%" >�ۺ���</td>
  <td  width="8%" >�˵���</td>
  <td  width="10%" >ǩ��-�˵�</td>
  <td  width="5%" >ǩԼ������</td>
  <td  width="5%" >ǩԼ�����</td>
  <td  width="5%" >ƽ������</td>
  <td  width="5%" >ƽ�׾���</td>
  <td  width="7%" >��Ʒ�</td>
  <td  width="4%" >�ۿ���</td>
</tr>
<%

	row=0;
	alltdje=0;
	allyjje=0;

	ls_sql=" SELECT fgsbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,count(*) qys,sum(crm_khxx.qye) qye,sum(crm_khxx.wdzgce) wdzgce,sum(crm_khxx.zhzjxje) zhzjxje,sum(crm_khxx.sjf+NVL(crm_khxx.sjhtsjf,0)) sjf,sum(crm_khxx.fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=" group by crm_khxx.fgsbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");


		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		//�˵�
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx";
		ls_sql+=" where cw_qmjzmx.zt in ('3')";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
		ls_sql+=" and cw_qmjzmx.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		row++;

		%>
		<tr align="center">
			<td  ><%=row%></td>
			<td  ><%=getfgsmc%></td>
			<td  align="right"  ><%=qys%></td>
			<td  align="right" ><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" ><%=cf.formatDouble(qye)%></td>
			<td  align="right" ><%=cf.formatDouble(tdje)%></td>
			<td  align="right" ><%=cf.formatDouble(yjje)%></td>
			<td  align="right" ><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" ><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" ><%=cf.formatDouble(pjde)%></td>
			<td  align="right" ><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" ><%=cf.formatDouble(sjf)%></td>
			<td  align="right" ><%=cf.round(zkl,1)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >�ܼ�</td>
	<td  align="right" ><%=allqys%></td>
	<td  align="right" ><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right" ><%=cf.formatDouble(allqye)%></td>
	<td  align="right" ><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" ><%=cf.formatDouble(allyjje)%></td>
	<td  >&nbsp;</td>
	<td  >&nbsp;</td>
	<td  align="right" ><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" ><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" ><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" ><%=cf.round(zkl,1)%></td>
</tr>
</table>




</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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


