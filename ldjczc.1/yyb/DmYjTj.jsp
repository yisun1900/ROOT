<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170203'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[������Ʒ�ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[������Ʒ�ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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
  <B>����ҵ��ͳ��</B><BR>
  <b>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="220%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" rowspan="2" >&nbsp;</td>
  <td  width="6%" rowspan="2" >�ֹ�˾</td>
  <td  width="6%" rowspan="2" >����</td>

  <td  width="3%" rowspan="2" ><font color="#FF0000">����</font></td>

  <td colspan="5" >��Ʒ�</td>
  <td colspan="5" >���Ի�</td>
  <td colspan="5" >�ײ�</td>
  <td colspan="3" >�ϼ�</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >����</td>
  <td  width="6%" >ʵ�����</td>
  <td  width="6%" >��˾�ƻ�</td>
  <td  width="3%" >��ɱ���</td>
  <td  width="4%" >�͵���</td>

  <td  width="3%" >����</td>
  <td  width="6%" >ʵ�����</td>
  <td  width="6%" >��˾�ƻ�</td>
  <td  width="3%" >��ɱ���</td>
  <td  width="4%" >�͵���</td>

  <td  width="3%" >����</td>
  <td  width="6%" >ʵ�����</td>
  <td  width="6%" >��˾�ƻ�</td>
  <td  width="4%" >��ɱ���</td>
  <td  width="4%" >�͵���</td>


  <td  width="6%" >�ϼ�</td>
  <td  width="6%" >������</td>
  <td  width="4%" >����ɱ���</td>
  </tr>
<%
	int xjrdkhs=0;
	int xjsssjfkhs=0;
	double xjsssjf=0;

	double xjdjsjh=0;
	double xjsjfjh=0;
	double xjgxhjh=0;
	double xjtcjh=0;
	double xjzcjh=0;
	double xjzjh=0;

	int xjgxhkhs=0;
	double xjgxhje=0;

	int xjtckhs=0;
	double xjtcje=0;


	int row=0;

	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");
		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));

		if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
		{
			dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"��"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				dmmc=dmmc+"<BR>(����:"+kdsj+")";
			}
		}



		//����
		int rdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		xjrdkhs+=rdkhs;


		//����ҵ������
		int djsjh=0;
		double sjfjh=0;
		double gxhjh=0;
		double tcjh=0;
		double zcjh=0;
		double zjh=0;
		ls_sql =" SELECT djsjh,sjfjh,gxhjh,tcjh,zcjh,zjh ";
		ls_sql+=" FROM cw_jrbmyjkh ";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ls_sql+=" order by khzq desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			djsjh=rs1.getInt("djsjh");
			sjfjh=rs1.getDouble("sjfjh");
			gxhjh=rs1.getDouble("gxhjh");
			tcjh=rs1.getDouble("tcjh");
			zcjh=rs1.getDouble("zcjh");
			zjh=rs1.getDouble("zjh");
		}
		rs1.close();
		ps1.close();

		xjdjsjh+=djsjh;
		xjsjfjh+=sjfjh;
		xjgxhjh+=gxhjh;
		xjtcjh+=tcjh;
		xjzcjh+=zcjh;
		xjzjh+=zjh;
		
		
		//ʵ����Ʒ�
		int sssjfkhs=0;
		double sssjf=0;
		ls_sql =" SELECT count(distinct cw_khfkjl.khbh) sssjfkhs,sum(fkje) sssjf ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where dwbh='"+getdwbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and fkje>0 and zffs!='31'";//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sssjfkhs=rs1.getInt("sssjfkhs");
			sssjf=rs1.getDouble("sssjf");
		}
		rs1.close();
		ps1.close();
		
		//����Ʒ�
		int tsjfkhs=0;
		double tsjf=0;
		ls_sql =" SELECT count(*) tsjfkhs,sum(fkje) tsjf ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where dwbh='"+getdwbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and fkje<0 and zffs!='31'";//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tsjfkhs=rs1.getInt("tsjfkhs");
			tsjf=rs1.getDouble("tsjf");
		}
		rs1.close();
		ps1.close();

		sssjfkhs=sssjfkhs-tsjfkhs;
		sssjf=sssjf-tsjf;

		xjsssjfkhs+=sssjfkhs;
		xjsssjf+=sssjf;

		
		//���-�͵���
		int sjpjde=0;
		if (sssjfkhs==0)
		{
			sjpjde=0;
		}
		else{
			sjpjde=(int)(sssjf/sssjfkhs);
		}
		
		//���-��ɱ���
		double sjfwcbl=0;
		if (sjfjh==0)
		{
			sjfwcbl=0;
		}
		else{
			sjfwcbl=(int)(sssjf*100.0/sjfjh);
		}

		//���Ի�
		int gxhkhs=0;
		double gxhje=0;
		ls_sql =" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1' ";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gxhkhs=rs1.getInt(1);
			gxhje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//���Ի��˵�
		int tdgxhkhs=0;
		double tdgxhje=0;
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1' ";
		ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdgxhkhs=rs1.getInt(1);
			tdgxhje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		gxhkhs=gxhkhs-tdgxhkhs;
		gxhje=gxhje-tdgxhje;

		xjgxhkhs+=gxhkhs;
		xjgxhje+=gxhje;

		
		//���Ի�-�͵���
		int gxhpjde=0;
		if (gxhkhs==0)
		{
			gxhpjde=0;
		}
		else{
			gxhpjde=(int)(gxhje/gxhkhs);
		}
		
		//���Ի�-��ɱ���
		double gxhwcbl=0;
		if (gxhjh==0)
		{
			gxhwcbl=0;
		}
		else{
			gxhwcbl=(int)(gxhje*100.0/gxhjh);
		}



		//�ײ�
		int tckhs=0;
		double tcje=0;
		ls_sql =" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='2' ";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tckhs=rs1.getInt(1);
			tcje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//�ײ��˵�
		int tdtckhs=0;
		double tdtcje=0;
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='2' ";
		ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdtckhs=rs1.getInt(1);
			tdtcje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		tckhs=tckhs-tdtckhs;
		tcje=tcje-tdtcje;

		xjtckhs+=tckhs;
		xjtcje+=tcje;
		
		//�ײ�-�͵���
		int tcpjde=0;
		if (tckhs==0)
		{
			tcpjde=0;
		}
		else{
			tcpjde=(int)(tcje/tckhs);
		}
		
		//���Ի�-��ɱ���
		double tcwcbl=0;
		if (tcjh==0)
		{
			tcwcbl=0;
		}
		else{
			tcwcbl=(int)(tcje*100.0/tcjh);
		}
		
		//����ɱ���
		double zwcbl=0;
		if (zjh==0)
		{
			zwcbl=0;
		}
		else{
			zwcbl=(int)((sssjf+gxhje+tcje)*100.0/zjh);
		}


//		if (   cxbz.equals("N") || (qys+sssjfkhs+tsjfkhs+rdkhs+bjkhs!=0)   )
		{
			row++;

			%>
			<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td align="center"><%=row%></td>
				<td align="center"><%=fgsmc%></td>
				<td align="center"><%=dmmc%></td>

				<td>
					<A HREF="ViewDmRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=rdkhs%></A>				
				</td>
				<td>
					<A HREF="ViewDmSssjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=sssjfkhs%></A>				
				</td>
				<td><%=cf.formatDouble((int)sssjf)%></td>
				<td><%=cf.formatDouble(sjfjh)%></td>
				<td><%=sjfwcbl%>%</td>
				<td><%=cf.formatDouble(sjpjde)%></td>

				<td>
					<A HREF="ViewDmGxhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=gxhkhs%></A>				
				</td>
				<td><%=cf.formatDouble((int)gxhje)%></td>
				<td><%=cf.formatDouble(gxhjh)%></td>
				<td><%=gxhwcbl%>%</td>
				<td><%=cf.formatDouble(gxhpjde)%></td>

				<td>
					<A HREF="ViewDmTcMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=tckhs%></A>				
				</td>
				<td><%=cf.formatDouble((int)tcje)%></td>
				<td><%=cf.formatDouble(tcjh)%></td>
				<td><%=tcwcbl%>%</td>
				<td><%=cf.formatDouble(tcpjde)%></td>

				<td><%=cf.formatDouble((int)(sssjf+gxhje+tcje))%></td>
				<td><%=cf.formatDouble(zjh)%></td>
				<td><%=zwcbl%>%</td>
			</tr>
			<%	
		}
	}
	rs.close();
	ps.close();


	//���-�͵���
	int sjpjde=0;
	if (xjsssjfkhs==0)
	{
		sjpjde=0;
	}
	else{
		sjpjde=(int)(xjsssjf/xjsssjfkhs);
	}
	
	//���-��ɱ���
	double sjfwcbl=0;
	if (xjsjfjh==0)
	{
		sjfwcbl=0;
	}
	else{
		sjfwcbl=(int)(xjsssjf*100.0/xjsjfjh);
	}
		
	//���Ի�-�͵���
	int gxhpjde=0;
	if (xjgxhkhs==0)
	{
		gxhpjde=0;
	}
	else{
		gxhpjde=(int)(xjgxhje/xjgxhkhs);
	}
	
	//���Ի�-��ɱ���
	double gxhwcbl=0;
	if (xjgxhjh==0)
	{
		gxhwcbl=0;
	}
	else{
		gxhwcbl=(int)(xjgxhje*100.0/xjgxhjh);
	}
	
	//�ײ�-�͵���
	int tcpjde=0;
	if (xjtckhs==0)
	{
		tcpjde=0;
	}
	else{
		tcpjde=(int)(xjtcje/xjtckhs);
	}
	
	//���Ի�-��ɱ���
	double tcwcbl=0;
	if (xjtcjh==0)
	{
		tcwcbl=0;
	}
	else{
		tcwcbl=(int)(xjtcje*100.0/xjtcjh);
	}
	
	//����ɱ���
	double zwcbl=0;
	if (xjzjh==0)
	{
		zwcbl=0;
	}
	else{
		zwcbl=(int)((xjsssjf+xjgxhje+xjtcje)*100.0/xjzjh);
	}

%>
<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="3"><B>С ��</B></td>

	<td><B><%=xjrdkhs%></B></td>
	<td><B><%=xjsssjfkhs%></B></td>
	<td><B><%=cf.formatDouble(xjsssjf)%></B></td>
	<td><B><%=cf.formatDouble(xjsjfjh)%></B></td>
				<td><%=sjfwcbl%>%</td>
				<td><%=cf.formatDouble(sjpjde)%></td>
	<td><B><%=xjgxhkhs%></B></td>
	<td><B><%=cf.formatDouble(xjgxhje)%></B></td>
	<td><B><%=cf.formatDouble(xjgxhjh)%></B></td>
				<td><%=gxhwcbl%>%</td>
				<td><%=cf.formatDouble(gxhpjde)%></td>

				<td><%=xjtckhs%></td>
				<td><%=cf.formatDouble((int)xjtcje)%></td>
				<td><%=xjtcjh%></td>
				<td><%=tcwcbl%>%</td>
				<td><%=cf.formatDouble(tcpjde)%></td>

				<td><%=cf.formatDouble((int)(xjsssjf+xjgxhje+xjtcje))%></td>
				<td><%=xjzjh%></td>
				<td><%=zwcbl%>%</td>
</tr>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 