<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";
String wheresql1="";

if (!(fgsbh.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgsbh+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgsbh+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  cw_qmjzmx.ywy in (select yhmc from sq_yhxx where dwbh='"+dwbh+"')";
	wheresql1+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}

wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>ҵ��Ա��תҵ��ͳ��(��ҵ��Աҵ������)</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="210%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="3%" >����</td>
  <td  width="5%" >ҵ��Ա</td>
  <td  width="8%" >�ֹ�˾</td>
  <td  width="8%" >ҵ��Ա��������</td>
  <td  width="6%" >��ְʱ��</td>
  <td  width="6%" >�����տ�ǩԼ��</td>
  <td  width="6%" >�˵���</td>
  <td  width="6%" >ҵ��</td>
  <td  width="6%" >ǩ����(���˵�)</td>
  <td  width="6%" >��ѯ�ͻ�����</td>
  <td  width="6%" >��������</td>
  <td  width="6%" >��ͬ���</td>
  <td  width="6%" >������</td>
  <td  width="6%" >�������ܶ� </td>
  <td  width="6%" >ƽ������</td>
  <td  width="6%" >ƽ�׾���</td>
  <td  width="6%" >��Ʒ�</td>
  <td  width="6%" >�ۿ���</td>
</tr>
<%
	int allqys=0;  //allzxkhs+=zxkhs;
    int allzxkhs=0;
	int alldjsl=0;
	double allwdzgce=0;
	double allqye=0;
	double allzhzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	long allfwmj=0;
	double maxqye=0;

	String ywy=null;
	String getywy=null;
	String getfgsbh=null;
	String getfgsmc=null;
	String getdwbh=null;
	String getdwmc=null;
	String oldfgsmc="";
	String getywydwmc=null;

	int qys=0;
	int zxkhs=0;
    int djsl=0;
	double qye=0;
	double wdzgce=0;
	double zhzjxje=0;
	long fwmj=0;
	double sjf=0;

	int pjde=0;
	int pmjj=0;
	double zkl=0;

	double tdje=0;//�˵���
	double alltdje=0;

	double yjje=0;//ҵ��
	double allyjje=0;

	int row=0;

	ls_sql=" SELECT fgsbh,ywy,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT cw_qmjzmx.fgsbh,cw_qmjzmx.ywy,count(*) qys,sum(DECODE(zt,'3',0,qye+NVL(guanlif,0)+NVL(suijin,0))) qye,sum(DECODE(zt,'3',0,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0))) wdzgce,sum(DECODE(zt,'3',0,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0))) zhzjxje,sum(DECODE(zt,'3',0,sjf)) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx";  //�ͻ���Ϣ��ĩ��ת��ϸ
	ls_sql+=" where cw_qmjzmx.zt in ('2','3')";
	ls_sql+="and  cw_qmjzmx.ywy is not null";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,cw_qmjzmx.ywy";

	ls_sql+=" UNION ALL";  //Ŀ�Ĳ�ѯ���е�ҵ��Ա

	ls_sql+=" SELECT ssfgs,yhmc,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where zwbm='19' and sfzszg in('Y','N')";     

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,ywy";
	ls_sql+=" order by qye desc,fgsbh,ywy";
//  out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		ywy=rs.getString("ywy");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		getywy=ywy;

		//�˵�
		ls_sql="SELECT sum(cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0) + (crm_tddj.stje-crm_tddj.ytje) ) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,crm_tddj";
		ls_sql+=" where cw_qmjzmx.fgsbh='"+getfgsbh+"' and cw_qmjzmx.ywy='"+ywy+"'";
		ls_sql+=" and cw_qmjzmx.zt='3' ";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.tdxh=crm_tddj.tdxh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//ͳ��δǩ������ѯ�ͻ�����
		ls_sql="SELECT count(*) zxkhs ";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where  ywy='"+ywy+"' and ssfgs='"+getfgsbh+"'" ;
		ls_sql+=" and zxzt in ('0','1','2','4','5')  ";
		ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zxkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

	    //ͳ��δǩ������ѯ�ͻ���������
		
		ls_sql=" SELECT count(*) djsl ";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where  ywy='"+ywy+"' and ssfgs='"+getfgsbh+"'  and  crm_zxkhxx.sjfbz='Y' " ;
		ls_sql+=" and zxzt in ('0','1','2','3','4','5')  ";
		ls_sql+=" and jsjfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and jsjfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			djsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		yjje=qye-tdje;

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

		ls_sql="SELECT dwmc"; //��ѯҵ��Ա���ڲ���
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.ssfgs='"+getfgsbh+"' and sq_yhxx.yhmc='"+ywy+"' ";
        ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh  ";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getywydwmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql="SELECT rzsj,lzrq,sfzszg";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm='19' and ssfgs='"+getfgsbh+"' and  yhmc='"+ywy+"' order by lrsj desc   ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sfzszg=rs1.getString("sfzszg");
			rzsj=cf.fillHtml(rs1.getDate("rzsj"));
			lzrq=cf.fillNull(rs1.getDate("lzrq"));
		}
		rs1.close();
		ps1.close();

		if (sfzszg.equals("S") || sfzszg.equals("T"))//M: ʵϰ����Y��ת����N�������ڣ�D�����ڣ�S����ְ��T������
		{
			ywy="<font color=\"#FF0033\">"+ywy+"</font>";
			rzsj="<font color=\"#FF0033\">("+rzsj+"��"+lzrq+")</font>";
		}

		alltdje+=tdje;
		allqys+=qys;
		allzxkhs+=zxkhs;
		alldjsl+=djsl;
		allwdzgce+=wdzgce;
		allqye+=qye;
		allzhzjxje+=zhzjxje;
		allzjhze+=qye+zhzjxje;
		allsjf+=sjf;
		allfwmj+=fwmj;
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
			<td><%=row%></td>
			<td><%=ywy%></td>
			<td><%=getfgsmc%></td>
			<td><%=getywydwmc%></td>
			<td><%=rzsj%></td>
			<td><A HREF="ViewYwycz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgsbh=<%=getfgsbh%>&ywy=<%=getywy%>" target="_blank"><%=cf.formatDouble(qye)%></A></td>
			<td><%=cf.formatDouble(tdje)%></td>
			<td><%=cf.formatDouble(yjje)%></td>
			<td><A HREF="ViewYwycz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgsbh=<%=getfgsbh%>&ywy=<%=getywy%>" target="_blank"><%=qys%></A></td>
			<td><A HREF="ViewYwyzxkhs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgsbh=<%=getfgsbh%>&ywy=<%=getywy%>" target="_blank"><%=zxkhs%></A></td>
			<td><%=djsl%></td>
			<td><%=cf.formatDouble(wdzgce)%></td>
			<td><%=cf.formatDouble((int)zhzjxje)%></td>
			<td><%=cf.formatDouble((int)(qye+zhzjxje))%></td>
			<td><%=cf.formatDouble(pjde)%></td>
			<td><%=cf.formatDouble(pmjj)%></td>
			<td><%=cf.formatDouble(sjf)%></td>
			<td><%=cf.round(zkl,1)%></td>
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
	<td>&nbsp;</td>
	<td>�ܼ�</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allqye)%></td>
	<td><%=cf.formatDouble(alltdje)%></td>
	<td><%=cf.formatDouble(allyjje)%></td>
	<td><%=allqys%></td>
	<td><%=allzxkhs%></td>
	<td><%=alldjsl%></td>
	<td><%=cf.formatDouble(allwdzgce)%></td>
	<td><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td><%=cf.formatDouble((long)allzjhze)%></td>
	<td><%=cf.formatDouble((long)pjde)%></td>
	<td><%=cf.formatDouble((long)pmjj)%></td>
	<td><%=cf.formatDouble((long)allsjf)%></td>
	<td><%=cf.round(zkl,1)%></td>
</tr>
</table>
</DIV>

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
 

