<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #CC3399}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");
String zt=request.getParameter("zt");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String sqdj="";
String xmzy="";
String clgw="";

double zcyfk=0;
double zcdjj=0;
double zzczk=0;

double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

double zcfk=0;
double htze=0;
String txxx="";

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int dds=0;
String jjsjs="";


String zczkl="10";

String listSql="";
String jjwjbz="";

String djlrfs="";//���Ķ�������¼�뷽ʽ  1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
String kgcxhdbl="";//���Ķ����Ƿ�ɸĴ��������  Y���ɸģ�N�����ɸ�
String dgkh=null;

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:��װ�ͻ�;4:�Ǽ�װ�ͻ�
	{
		ls_sql="select dgkh,khxm,crm_khxx.xmzy,crm_khxx.clgw,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dgkh=cf.fillNull(rs.getString("dgkh"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
			clgw=cf.fillNull(rs.getString("clgw"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			hth=cf.fillNull(rs.getString("hth"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			qye=cf.fillNull(rs.getString("qye"));
			kgrq=cf.fillNull(rs.getDate("kgrq"));
			jgrq=cf.fillNull(rs.getDate("jgrq"));
			ssfgs=cf.fillNull(rs.getString("fgsbh"));
			dmbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			qyrq=cf.fillNull(rs.getDate("qyrq"));
			jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select dgkh,khxm,crm_zxkhxx.clgw,fwdz,lxfs,khjl,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dgkh=cf.fillNull(rs.getString("dgkh"));
			clgw=cf.fillNull(rs.getString("clgw"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		}
		rs.close();
		ps.close();

		if (dmbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dmbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));
			}
			rs.close();
			ps.close();
		}
	}


	//���ͻ����㣫������������������������ʼ
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (!getkhjsbz.equals("N") && !getkhjsbz.equals("") && !getkhjsbz.equals("3"))//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
	{
		out.println("<font color=\"#FF0000\">���󣡿ͻ��ѽ���</font>:"+getkhjsbz);
		return;
	}
	//���ͻ����㣽����������������������������


	if (jjsjs.equals(""))
	{
		ls_sql="select cgsjs";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("cgsjs"));
		}
		rs.close();
		ps.close();
	}

	if (jjsjs.equals(""))
	{
		ls_sql="select jjsjs";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("jjsjs"));
		}
		rs.close();
		ps.close();
	}



	if (jjwjbz.equals("Y"))
	{
		out.println("���󣡿ͻ��Ҿ�����ᣬ������¼�붩��");
		return;
	}



	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();


	//����Ԥ����
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���� 
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���� 
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk+=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	zcyfk=cf.round(zcyfk,2);
	//��ֵ��ֵ��
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='67'";//67����ֵ��ֵ��
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzczk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='67'";//67����ֵ��ֵ��
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzczk+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��ɫ������ȯ��
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55�����Ĵ���ȯ
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdjj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55�����Ĵ���ȯ
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdjj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and clzt>'07' and clzt not in('98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (htze-zcfk > zcyfk)
	{
		txxx="<B><font color='#FF0000'>���ѣ��ͻ�Ӧ�����"+cf.round(htze-zcfk-zcyfk-zcdjj,2)+"�������ܶ"+htze+"�������Ѹ��"+zcfk+"������Ԥ����:"+(zcyfk+zcdjj)+"</font></B>";
	}

	int count=0;
	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ddbh=khbh+cf.addZero(count+1,2);

	dds=count;
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<table width="100%" style='FONT-SIZE: 14px'>
  <tr>
    <td width="100%"> 
      <div align="center">��¼�����ĺ�ͬ��������ţ�<%=ddbh%>��
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform"  >
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">�������</td>
		<td  width="4%">�����˻�</td>
		<td  width="4%">�����˻�</td>
		<td  width="9%">����״̬</td>
		<td  width="11%">Ʒ��</td>
		<td  width="6%">�Ҿӹ���</td>
		<td  width="9%">���ۺ�ͬ��</td>
		<td  width="9%">����Ʒ���Ϸ�</td>
		<td  width="9%">�ؼ�Ʒ���Ϸ�</td>
		<td  width="8%">��װ���ϼӹ���</td>
		<td  width="8%">Զ�̷�</td>
		<td  width="9%">��ͬ�ܶ�</td>
		<td  width="8%">¼��ʱ��</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,'<A HREF=\"InsertJc_zcddTd.jsp?ddbh='||jc_zcdd.ddbh||'\" >�˵�</A>','<A HREF=\"InsertJc_zcddTh.jsp?ddbh='||jc_zcdd.ddbh||'\" >�˻�</A>',clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xshth,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.wdzje,jc_zcdd.lrsj";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"' ";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" and jc_zcdd.ddlx='C'";//9:ѡ����������
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();


	%>
	</table>
	<%
}
%>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                �ͻ����              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                ��ͬ��              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">�ͻ�����</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">���ݵ�ַ</td>
              <td width="32%"><%=fwdz%></td>
            </tr>
            
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                ʩ����              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
              (<%=sgbz%>)</td>
              <td width="18%" align="right">��װǩԼ����</td>
              <td width="32%"><%=qyrq%></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">��ͬ����</td>
              <td width="31%"><%=kgrq%>����<%=jgrq%></td>
              <td width="18%" align="right">�ʼ�</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">�μӴ����</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right">&nbsp;</td>
              <td colspan="3"><%=txxx%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><strong>�����ܶ�</strong></td>
              <td><%=htze%></td>
              <td align="right"><b>�����Ѹ���</b></td>
              <td><%=zcfk%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><font color="#FF0000"><b>Ԥ�������</b></font></td>
              <td colspan="3"><%=cf.round(zcyfk+zcdjj-(htze-zcfk),2)%><strong>������Ԥ������Ĵ���ȯ�������Ѹ�������ܶ������¶��������˽����Ҫ�ͻ�����</strong></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"><b>����Ԥ����</b></td>
              <td width="31%"><%=zcyfk%></td>
              <td width="18%" align="right"><strong>���Ĵ���ȯ</strong></td>
              <td width="32%"><%=zcdjj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���Ĵ���</td>
              <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td align="right">����С��</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>Ʒ��</td>
              <td colspan="3">
			  <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX"  >
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��������</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qhtsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��ͬ�ͻ�ʱ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>���ĺ�ͬ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="xshth" value="" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>פ��Ҿӹ���</td>
              <td bgcolor="#FFFFFF"><select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
				if (clgw.equals(""))
				{
					out.println("<option value=\"\"></option>");

					listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
					listSql+=" UNION ALL ";
					listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
					listSql+=" ORDER BY c2 ";
					cf.selectItem(out,listSql,yhmc);
				}
				else{
					out.println("<option value=\""+clgw+"\">"+clgw+"</option>");
				}
%>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*<strong><font color="#FF00FF">����Ʒ-���Ϸ�</font></strong></font></td>
              <td><input name="zcpclf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><strong><font color="#660099">�ؼ�Ʒ-���Ϸ�</font></strong></td>
              <td><input name="tjpclf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>��װ���ϼӹ���</td>
              <td><input name="qtf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right"><font color="#FF0000">*</font>Զ�̷�</td>
              <td><input name="ycf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">��ͬ�ܶ�</font></td>
              <td colspan="3"><input type="text" name="wdzje" value="" size="20" maxlength="20"  readonly>
              ��ͬ�ܶ����Ʒ���Ϸѣ��ؼ�Ʒ���Ϸѣ���װ���ϼӹ��ѣ�Զ�̷�</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td rowspan="4" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>���ʽ<BR><BR><input  type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ"></td>
              <td colspan="3">&nbsp;�١�<strong>��ɫ������ȯ��</strong>��Ŀǰ���ý�
			   <input type="text" name="zcdjj" size="8" value="<%=zcdjj%>" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
			  ������ת����              
              <input name="djjzkje" type="text" onChange="f_jsjg(insertform)" value="" size="10" maxlength="20"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="3">&nbsp;�ڡ�<strong>��ֵ��ֵ��</strong>��Ŀǰ���ý�
                <input type="text" name="zzczk" size="8" value="<%=zzczk%>" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
������ת����
<input name="zzczkzkje" type="text" onChange="f_jsjg(insertform)" value="" size="10" maxlength="20"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="3">&nbsp;�ۡ�<strong>����Ԥ����</strong>��Ŀǰ���ý�
			   <input type="text" name="zcyfk" size="8" value="<%=zcyfk%>" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
			  ������ת����
              <input name="yfkzkje" type="text" onChange="f_jsjg(insertform)" value="" size="10" maxlength="20"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="3">&nbsp;�ܡ�<strong>ֽ�ʲ���ȯ</strong>
                <select name="djqmc" style="FONT-SIZE:12PX;WIDTH:162PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select djqmc c1,djqmc c2 from cw_djq where fgsbh='"+ssfgs+"'  order by djqmc","");
%>
                </select>
              ������ʹ�ý��
              <input name="djqje" type="text" onChange="f_jsjg(insertform)" value="0" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
ƾ֤��
<input name="sjbh" type="text" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" size="20" maxlength="20"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼����</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zqclf" value="0" >
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="qddm" value="<%=dmbh%>" >
                <input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zt" value="<%=zt%>">

				<input type="button"  value="����" onClick="f_do(insertform)">
				<input name="button" type="button" onClick="window.open('/jcjj/dygl/dgzcdy.jsp?khbh=<%=khbh%>')"  value="��ӡ">
				<input type="reset"  value="����" name="reset">
				<input type="hidden" name="xmzy" value="<%=xmzy%>" >
                <input type="hidden" name="jjsjs" value="<%=jjsjs%>" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddshbz" value="1" >
                <input type="hidden" name="jhtzshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >
                <input type="hidden" name="dzyy" value="" >
                <input type="hidden" name="kjxsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
                <input type="hidden" name="hkze" value="" size="20" maxlength="20" >
                <input type="hidden" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                <input type="hidden" name="htcxhdje" value="0" size="20" maxlength="10" >
                <input type="hidden" name="jmje" value="0" size="20" maxlength="20" ></td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;



function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	insertform.ycf.readOnly=false;
	insertform.qtf.readOnly=false;

	var sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.zcdlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
//	window.open(actionStr);
}



function getPp(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select distinct jxc_ppxx.ppmc c1,jxc_ppxx.ppmc  c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
		getPp(insertform);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
}


function f_jsjg(FormName)//����FormName:Form������
{
	var zqclf=0;
	zqclf=FormName.zcpclf.value*1.0+FormName.tjpclf.value*1.0;
	zqclf=round(zqclf,2);
	FormName.zqclf.value=zqclf;
	
	var wdzje=0;
	wdzje=FormName.zqclf.value*1.0+FormName.qtf.value*1.0+FormName.ycf.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;
	
	FormName.hkze.value=FormName.wdzje.value;
	FormName.zczkl.value=10;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.qhtsj)=="") {
		alert("������[��������]��");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.htshsj)=="") {
		alert("������[��ͬ�ͻ�ʱ��]��");
		FormName.htshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.xshth)=="") {
		alert("������[���ĺ�ͬ��]��");
		FormName.xshth.focus();
		return false;
	}

	if(	javaTrim(FormName.clgw)=="") {
		alert("������[פ��Ҿӹ���]��");
		FormName.clgw.focus();
		return false;
	}
	
	
	if(	javaTrim(FormName.zcpclf)=="") {
		alert("������[����Ʒ-���Ϸ�]��");
		FormName.zcpclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcpclf, "����Ʒ-���Ϸ�"))) {
		return false;
	}

	if(	javaTrim(FormName.tjpclf)=="") {
		alert("������[�ؼ�Ʒ-���Ϸ�]��");
		FormName.tjpclf.focus();
		return false;
	}

	if(!(isFloat(FormName.tjpclf, "�ؼ�Ʒ-���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqclf)=="") {
		alert("������[���Ϸ�]��");
		FormName.zqclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqclf, "���Ϸ�"))) {
		return false;
	}


	if(	javaTrim(FormName.qtf)=="") {
		alert("������[��װ���ϼӹ���]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "��װ���ϼӹ���"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	
	
	if(	javaTrim(FormName.wdzje)=="") {
		alert("������[��ͬ�ܶ�]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "��ͬ�ܶ�"))) {
		return false;
	}

	if (parseFloat(FormName.wdzje.value)==0)
	{
		alert("[��ͬ�ܶ�]����Ϊ0��");
		FormName.zqclf.select();
		return false;
	}


	if(!(isFloat(FormName.djqje, "ֽ�ʲ���ȯ"))) {
		return false;
	}
	if (parseFloat(FormName.djqje.value)!=0)
	{
		if(	javaTrim(FormName.djqmc)=="") {
			alert("������[ֽ�ʲ���ȯ����]��");
			FormName.djqmc.focus();
			return false;
		}
		if(	javaTrim(FormName.sjbh)=="") {
			alert("������[ƾ֤��]��");
			FormName.sjbh.focus();
			return false;
		}
	}
	else{
		FormName.djqmc.value="";
		FormName.sjbh.value="";
	}


	if(	javaTrim(FormName.djjzkje)=="") {
		alert("������[��ɫ������ȯ��ת����]��");
		FormName.djjzkje.focus();
		return false;
	}
	if(!(isFloat(FormName.djjzkje, "��ɫ������ȯ��ת����"))) {
		return false;
	}
	if (parseFloat(FormName.zcdjj.value)<parseFloat(FormName.djjzkje.value))
	{
		alert("��ɫ������ȯ������[ת����]���ܴ���[Ŀǰ���ý��]��");
		FormName.djjzkje.select();
		return false;
	}

	if(	javaTrim(FormName.zzczkzkje)=="") {
		alert("������[��ֵ��ֵ��ת����]��");
		FormName.zzczkzkje.focus();
		return false;
	}
	if(!(isFloat(FormName.zzczkzkje, "��ֵ��ֵ��ת����"))) {
		return false;
	}
	if (parseFloat(FormName.zzczk.value)<parseFloat(FormName.zzczkzkje.value))
	{
		alert("��ֵ��ֵ���������[ת����]���ܴ���[Ŀǰ���ý��]��");
		FormName.zzczkzkje.select();
		return false;
	}

	if(	javaTrim(FormName.yfkzkje)=="") {
		alert("������[����Ԥ����ת����]��");
		FormName.yfkzkje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkzkje, "����Ԥ����ת����"))) {
		return false;
	}
	if (parseFloat(FormName.zcyfk.value)<parseFloat(FormName.yfkzkje.value))
	{
		alert("����Ԥ�������[ת����]���ܴ���[Ŀǰ���ý��]��");
		FormName.yfkzkje.select();
		return false;
	}


	var zkze=FormName.djjzkje.value*1.0+FormName.zzczkzkje.value*1.0+FormName.yfkzkje.value*1.0+FormName.djqje.value*1.0;
	if (zkze!=parseFloat(FormName.wdzje.value))
	{
		alert("���󣡺�ͬ�ܶ����[ת����]��");
		FormName.yfkzkje.select();
		return false;
	}




	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}




	FormName.action="SaveInsertJc_zcdd.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;

}



//-->
</SCRIPT>