<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

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

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:��װ�ͻ�;4:�Ǽ�װ�ͻ�
	{
		ls_sql="select khxm,crm_khxx.xmzy,crm_khxx.clgw,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clgw=cf.fillNull(rs.getString("clgw"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
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
		ls_sql="select khxm,crm_zxkhxx.clgw,fwdz,lxfs,khjl,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
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


	//Ԥ����
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
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
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='63'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='64'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='65'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dhze=0;
	ls_sql="select sum(hkze+zjhze)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>'07' and clzt not in('98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dhze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���ں�ͬ����������������˵����
	//���ĺ�ͬ������
	double zcje=0;
	ls_sql="SELECT sum(jc_zcdd.hkze) htze";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zcje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���������������
	double zczjxje=0;
	ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where jc_zczjx.khbh='"+khbh+"'";
	ls_sql+=" and jc_zczjx.clzt not in('00')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zczjxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double zcfkze=0;
	ls_sql="select sum(hkze+zjhze)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();


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

<form method="post" action="" name="insertform" target="_blank">
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">�������</td>
		<td  width="9%">����״̬</td>
		<td  width="14%">Ʒ��</td>
		<td  width="6%">���Ϲ���</td>

		<td  width="6%">��ĿרԱ</td>
		<td  width="9%">��ͬ�ܶ�</td>
		<td  width="9%">��������</td>
		<td  width="9%">¼��ʱ��</td>
		<td  width="6%">¼����</td>
		<td  width="16%">��ע</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.lrsj,jc_zcdd.lrr,jc_zcdd.bz";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
		//������ʾ��
	String[] disColName={"clgw"};
	pageObj.setDisColName(disColName);

	%>
	</table>
	<%
}
%>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#CCCCFF"> 
                �ͻ����              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                ��ͬ��              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">�ͻ�����</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">���ݵ�ַ</td>
              <td width="32%"><%=fwdz%></td>
            </tr>
            
            <tr> 
              <td width="20%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"> 
                ʩ����              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
              (<%=sgbz%>)</td>
              <td width="18%" align="right">��װǩԼ����</td>
              <td width="32%"><%=qyrq%></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">��ͬ����</td>
              <td width="31%"><%=kgrq%>����<%=jgrq%></td>
              <td width="18%" align="right">�ʼ�</td>
              <td width="32%"><%=zjxm%></td>
            </tr>

            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"><font color="#0000FF">��ͬ�ܶ�</font></td>
              <td width="31%"> 
                <input type="text" name="hkze" value="0" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#0000FF">δ���ۺ�ͬ��</font></td>
              <td width="32%"> 
                <input type="text" name="wdzje" value="0" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"><font color="#0000FF">�����������</font></td>
              <td width="31%"> 
                <input type="text" name="htcxhdje" value="0" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font><font color="#0000FF">�����ۿ�</font></td>
              <td width="32%"><input type="text" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                <b><font color="#0000FF">��>0��<=10��</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>���Ĵ���</td>
              <td width="31%"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>Ʒ��</td>
              <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX" onChange="changePp(insertform)">
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����ԭ��</td>
              <td colspan="3"> 
                <textarea name="dzyy" cols="71" rows="3"></textarea>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000FF">�Ż�����</font></td>
              <td colspan="3"  id="yhnr"></td>
            </tr>
            
    <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"><font color="#FF0000">*</font>���Ϲ���</td>
    <td width="31%"> 
    <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>

    <td width="18%" align="right">�Ҿ����ʦ </td>
    <td width="32%"><select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <%
	listSql="select sq_yhxx.yhmc c1,sq_yhxx.yhmc||':'||sq_yhxx.dh c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||':'||sq_yhxx.dh c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,jjsjs);
%>
    </select></td>
    </tr>
             
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>�Ƿ�ȴ��ͻ�֪ͨ              </td>
              <td width="31%"> 
                <input type="radio" name="ddshbz" value="1" checked>����ȴ�֪ͨ                
                <input type="radio" name="ddshbz" value="2" >��ȴ�֪ͨ				</td>
              <td width="18%" align="right"> 
                �ƻ�֪ͨ�ͻ�ʱ��              </td>
              <td width="32%"> 
                <input type="text" name="jhtzshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ͬ�ͻ�ʱ��</td>
              <td width="31%"> 
                <input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>ǩ��ͬʱ��</td>
              <td width="32%"> 
                <input type="text" name="qhtsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                �ɼ����ֹʱ��              </td>
              <td width="32%"> 
                <input type="text" name="kjxsj" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼����</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 

                <input type="hidden" name="xmzy" value="" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="qddm" value="<%=dmbh%>" >
                <input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zt" value="<%=zt%>">

				<input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="��ɺ�ͬ" onClick="f_wc(insertform)" name="wc" disabled>
                <input type="button"  value="��ӡ��ͬ" onClick="window.open('/jcjj/dygl/zcht.jsp?ddbh=<%=ddbh%>')" name="dy" disabled>
                <input type="hidden" name="zcxlbm" value="">
                <BR>
                <BR>
                <input type="button"  value="¼�룭�����ͺ�" onClick="f_srxh(insertform)" name="srxh" disabled>
                <input type="button"  value="¼�룭��ѯ�ͺ�" onClick="f_cxxh(insertform)" name="cxxh" disabled>
                <input type="button"  value="¼����д��Ŀ" onClick="f_xzwc(insertform)" name="xzwc" disabled>
                  <input type="button"  value="�����޸���ϸ" onClick="f_plxg(insertform)" name="plxg" disabled>
                  <input type="button"  value="�����޸���ϸ" onClick="f_dpxg(insertform)" name="dpxg" disabled></td>
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
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select jxc_ppxx.ppmc c1,jxc_ppxx.ppmc||NVL2(yhkssj,'���Ż���'||TO_CHAR(yhkssj,'YYYY-MM-DD')||'��'||TO_CHAR(yhjzsj,'YYYY-MM-DD')||'��','') c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function changePp(FormName)
{
	czlx=4;

	var sql="select sfyyh,yhkssj,yhjzsj,yhnr ";
	sql+=" from  jxc_ppxx,jxc_ppgysdzb";
	sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
	sql+=" and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.ppmc='"+FormName.ppbm.value+"'";

	var actionStr="/jcjj/zcdd/getPpYhnr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
	else if (czlx==4)
	{
		document.getElementById('yhnr').innerHTML="";
		txtNode=document.createTextNode(ajaxRetStr);//��Ӧ��
		document.getElementById('yhnr').appendChild(txtNode);
	}
}


function f_do(FormName)//����FormName:Form������
{
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

	
/*	
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.jkxz)) {
		alert("��ѡ��[�ͻ���������]��");
		FormName.jkxz[0].focus();
		return false;
	}

	if (FormName.jkxz[0].checked)
	{
		notRadio(FormName.jkdd);
	}
	else{
		if(	!radioChecked(FormName.jkdd)) {
			alert("��ѡ��[����ص�]��");
			FormName.jkdd[0].focus();
			return false;
		}
	}
*/

	if(	javaTrim(FormName.hkze)=="") {
		alert("��ѡ��[��ͬ�ܶ�]��");
		FormName.hkze.focus();
		return false;
	}
	if(!(isFloat(FormName.hkze, "��ͬ�ܶ�"))) {
		return false;
	}
/*
	if (parseFloat(FormName.hkze.value)==0)
	{
		alert("[��ͬ�ܶ�]����Ϊ0��");
		FormName.hkze.select();
		return false;
	}
*/
	if(	javaTrim(FormName.wdzje)=="") {
		alert("������[δ���ۺ�ͬ��]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "δ���ۺ�ͬ��"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.hkze.value))
	{
		alert("[δ���ۺ�ͬ��]����С��[��ͬ�ܶ�]��");
		FormName.hkze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("��ѡ��[δ���ۺ�ͬ��]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "δ���ۺ�ͬ��"))) {
		return false;
	}
	if(	javaTrim(FormName.htcxhdje)=="") {
		alert("��ѡ��[�����������]��");
		FormName.htcxhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htcxhdje, "�����������"))) {
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
		alert("������[���Ϲ���]��");
		FormName.clgw.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.xmzy)=="") {
		alert("������[��ĿרԱ]��");
		FormName.xmzy.focus();
		return false;
	}
	if(	javaTrim(FormName.ztjjgw)=="") {
		alert("������[չ���Ҿӹ���]��");
		FormName.ztjjgw.focus();
		return false;
	}
*/
	if(	!radioChecked(FormName.ddshbz)) {
		alert("��ѡ��[�Ƿ�ȴ��ͻ�֪ͨ]��");
		FormName.ddshbz[0].focus();
		return false;
	}


	if(!(isDatetime(FormName.jhtzshsj, "�ƻ�֪ͨ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "�ɼ����ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("������[ǩ��ͬʱ��]��");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "ǩ��ͬʱ��"))) {
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
	if(	javaTrim(FormName.zczkl)=="") {
		alert("������[�����ۿ�]��");
		FormName.zczkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zczkl, "�����ۿ�"))) {
		return false;
	}
	if (FormName.zczkl.value<=0 || FormName.zczkl.value>10)
	{
		alert("����[�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.zczkl.select();
		return false;
	}
	if (FormName.zczkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("������[����ԭ��]��");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_zcdd.jsp";
	FormName.submit();

	FormName.srxh.disabled=false;
	FormName.cxxh.disabled=false;
	FormName.xzwc.disabled=false;
	FormName.plxg.disabled=false;
	FormName.dpxg.disabled=false;
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;

	return true;

}
function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zcdd.jsp";
	FormName.submit();
	return true;
}
function f_srxh(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";
	FormName.submit();
	return true;
}
function f_cxxh(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}

function f_xzwc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtDj.jsp";
		<%
	}
	else if (djlrfs.equals("2"))
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtZk.jsp";
		<%
	}
	else
	{
		%>
		FormName.action="InsertJc_zcddmxSxht.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_plxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			%>
			FormName.action="EditAllDjBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllDjJc_zcddmx.jsp";
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			%>
			FormName.action="EditAllZkBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllZkJc_zcddmx.jsp";
			<%
		}
	}
	else
	{
		%>
		FormName.action="EditAllNoJc_zcddmx.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_dpxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}



function f_tc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxBj_tczcbj.jsp";
	FormName.submit();
	return true;
}

function f_dp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxBj_tcwzck.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
