<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sjbh=null;
String fklxbm=null;
double fkje=0;
String jkr=null;
String skr=null;
String sksj=null;
String skdw=null;
String lrr=null;
String lrsj=null;
String shbz=null;
String shr=null;
String shsj=null;
String bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String khlx=null;
String zcgysbh=null;
String zcddbh=null;
String zczjxbh=null;
String fgsbh=null;
String zzyhkh=null;

String khxm="";
String fwdz="";
String lxfs="";
String sjs="";
String qye="";
String hth="";
String dwbh="";
String sgd="";
String zjxm="";
String qyrq="";
String zt="";
String sjfkzc=null;
String glxh=null;
String gljlbz=null;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";
double scfjk=0;
double jxglf=0;
double rzf=0;

double glf=0;
double kglf=0;
double kqtk=0;
double gckk=0;
double suijin=0;

String yjjzsj=null;

String zcmmbz="";//�����տ���
String mmbz="";//ľ���տ���
String cgjjbz="";//�����տ���
String jjbz="";//�Ҿ��տ���

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zzyhkh,yjjzsj,zckx,lrdw,khbh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr,lrsj,bz,zffs,zcgysbh,zcddbh,zczjxbh,fgsbh,glxh,gljlbz ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzyhkh=cf.fillNull(rs.getString("zzyhkh"));
		yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkje=rs.getDouble("fkje");
		jkr=cf.fillNull(rs.getString("jkr"));
		skr=cf.fillNull(rs.getString("skr"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skdw=cf.fillNull(rs.getString("skdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zffs=cf.fillNull(rs.getString("zffs"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		glxh=cf.fillNull(rs.getString("glxh"));
		gljlbz=cf.fillNull(rs.getString("gljlbz"));
	}
	else{
		rs.close();
		ps.close();

		out.println("�����ڵ��տ��¼");
		return;
	}
	rs.close();
	ps.close();

	if (!yjjzsj.equals(""))
	{
//		out.println("�տ��¼�ѽ�ת���������޸ģ���תʱ�䣺"+yjjzsj);
//		return;
	}

	if (gljlbz.equals("Y"))//N���ǹ�����¼��Y��������¼
	{
		String glfkxh=null;
		ls_sql="select fkxh";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where glxh='"+glxh+"' and gljlbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfkxh=cf.fillNull(rs.getString("fkxh"));
		}
		rs.close();
		ps.close();

		out.println("���󣡸�����¼�ǹ�����¼������ֱ�ӽ����޸ģ����޸�ԭʼ��¼��"+glfkxh);
		return;
	}

	ls_sql="select suijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy ,kqtk,kglf,gckk,glf ,khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,qyrq,zjxm,zt,sjfkzc";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckk=rs.getDouble("gckk");
		glf=rs.getDouble("glf");
		suijin=rs.getDouble("suijin");

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		hth=cf.fillNull(rs.getString("hth"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zt=cf.fillNull(rs.getString("zt"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,fwdz,lxfs,sjs,zxdm,sjfkzc,cxhdbm";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			dwbh=cf.fillNull(rs.getString("zxdm"));
			sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		}
	}
	rs.close();
	ps.close();


	ls_sql=" select zcmmbz,mmbz,cgjjbz,jjbz ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
	}
	rs.close();
	ps.close();

	//�г������
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='91' and scbz='N'";//91���г������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		scfjk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��������
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='94' and scbz='N'";//94����������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jxglf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��֤��
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='95' and scbz='N'";//95����֤��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rzf=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="7%">�տ����</td>
			<td  width="14%" colspan="2">�տ�����</td>
			<td  width="9%" bgcolor="#CCCCCC">�տ�Ʒ��</td>
			<td  width="7%" bgcolor="#CCCCCC">�տ�����</td>
			<td  width="7%" bgcolor="#CCCCCC">�տ���������</td>
			<td  width="8%">ʵ�տ���</td>
			<td  width="5%">���</td>
			<td  width="6%">֧��</td>
			<td  width="7%">ת�ʿ���</td>
			<td  width="9%">ת��Ʒ��</td>
			<td  width="7%">ת�ʶ������</td>
			<td  width="7%">ת����������</td>
			<td  width="7%">�տ�ʱ��</td>
		</tr>
		<%
		String getfkxh=null;
		String fklxmc=null;
		String getfkcsmc=null;
		String getgysbh=null;
		String getddbh=null;
		String getzjxbh=null;
		double getfkje=0;
		double xjfkje=0;
		double zjfkje=0;
		String skdd=null;
		String zffsmc=null;
		String getzckx=null;
		String getzcgysbh=null;
		String getzcddbh=null;
		String getzczjxbh=null;
		String getsksj=null;

		String getddlxmc="";

		String oldfklxmc="";

		ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,cw_khfkjl.fkje,DECODE(skdd,'1','����','2','�����') skdd";
		ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,cw_khfkjl.sksj";
		ls_sql+=" ,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������') ddlxmc";
		ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs,jc_zcdd  ";
		ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
		ls_sql+=" order by cw_khfkjl.fklxbm,jc_zcdd.ddlx,gysbh,fkxh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getddlxmc=cf.fillHtml(rs.getString("ddlxmc"));
			getfkxh=rs.getString("fkxh");
			fklxmc=cf.fillHtml(rs.getString("fklxmc"));
			getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
			getgysbh=cf.fillHtml(rs.getString("gysbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			getzjxbh=cf.fillHtml(rs.getString("zjxbh"));
			getfkje=rs.getDouble("fkje");
			skdd=cf.fillHtml(rs.getString("skdd"));
			zffsmc=cf.fillHtml(rs.getString("zffsmc"));
			getzckx=cf.fillHtml(rs.getString("zckx"));
			getzcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
			getzcddbh=cf.fillHtml(rs.getString("zcddbh"));
			getzczjxbh=cf.fillHtml(rs.getString("zczjxbh"));
			getsksj=cf.fillHtml(rs.getDate("sksj"));

			if (getfkcsmc.equals("&nbsp;"))
			{
				getfkcsmc=getddlxmc;
			}

			if (!oldfklxmc.equals(fklxmc))
			{
				if (!oldfklxmc.equals(""))
				{
					%>
					<tr bgcolor="#FFFFFF"  align="center">
						<td colspan='2'><B><<%=oldfklxmc%>>С��</B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<%
				}

				oldfklxmc=fklxmc;
				xjfkje=0;
			}

			xjfkje+=getfkje;
			zjfkje+=getfkje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
				<td><%=fklxmc%></td>
				<td><%=getfkcsmc%></td>
				<td><%=getgysbh%></td>
				<td><%=getddbh%></td>
				<td><%=getzjxbh%></td>
				<td align="right"><%=cf.formatDouble(getfkje)%></td>
				<td><%=skdd%></td>
				<td><%=zffsmc%></td>
				<td><%=getzckx%></td>
				<td><%=getzcgysbh%></td>
				<td><%=getzcddbh%></td>
				<td><%=getzczjxbh%></td>
				<td><%=getsksj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='2'><B><<%=fklxmc%>>С��</B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='5'><B>�� ��</B></td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		</table>
		<%

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

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸Ŀͻ��տ��¼��<font color="#0000CC">�տ���ţ�<%=fkxh%></font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCw_khfkjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
              <td align="right">�ͻ����</td>
              <td><%=khbh%></td>
              <td align="right">��ͬ��</td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"> �ͻ����� </td>
              <td><%=khxm%> </td>
              <td align="right">���ʦ</td>
              <td><%=sjs%>��
                  <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%>
                ��</td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"> ���ݵ�ַ </td>
              <td colspan="3"><%=fwdz%> </td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>�տ�����</td>
              <td width="33%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fkdl not in('1','2') order by fklxbm",fklxbm);
%> 
                </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�տ���</td>
              <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" onChange="checkZkje(insertform);"></td>
              <td align="right"><font color="#FF0000">*</font>֧����ʽ</td>
              <td><select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm",zffs);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ת�ʿ���</td>
              <td><select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm!='"+fklxbm+"' order by fklxbm",zckx);
%>
              </select></td>
              <td align="right">����ת���ʺ�</td>
              <td><input name="zzyhkh" type="text" value="<%=zzyhkh%>" size="20" maxlength="40"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ת�ʶ���</td>
              <td colspan="3"> 
                <select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="checkZkje(insertform)">
                  <option value=""></option>
                  <%
	if (zckx.equals("23"))//���Ŀ�
	{
		if (zcmmbz.equals("Y"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
		{
			if (zczjxbh.equals(""))
			{
				zcgysbh=zcgysbh+"*"+zcddbh;
			}
			else {
				zcgysbh=zcgysbh+"*"+zcddbh+"*"+zczjxbh;
			}

		
			ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'������:'||ddbh||'������'||sum(fkje)||'��'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and zjxbh is null and scbz='N' and fklxbm='23' ";
			ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
			ls_sql+=" group by gysbh,ddbh";
			ls_sql+=" order by gysbh,ddbh ";

			
			cf.selectItem(out,ls_sql,zcgysbh);
		
			ls_sql="SELECT gysbh||'*'||ddbh||'*'||zjxbh  c1,gysbh||'������:'||zjxbh||'������'||sum(fkje)||'��'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and zjxbh is not null and scbz='N' and fklxbm='23' ";
			ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
			ls_sql+=" group by gysbh,ddbh,zjxbh";
			ls_sql+=" order by gysbh,ddbh,zjxbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
		else if (zcmmbz.equals("N"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
		{
			ls_sql="SELECT gysbh c1,gysbh||'����'||sum(fkje)||'��'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";

			cf.selectItem(out,ls_sql,zcgysbh);
		}
	}

%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>�տ���              </td>
              <td width="33%"> 
                <input type="text" name="skr" size="20" maxlength="20"  value="<%=skr%>" >              </td>
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>�տ�ʱ��              </td>
              <td width="33%"> 
                <input type="text" name="sksj" size="20" maxlength="10"  value="<%=sksj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">�տλ</font>              </td>
              <td width="33%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'",skdw);
%> 
                </select>              </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">�վݱ��</td>
              <td width="33%"><input type="text" name="sjbh" size="20" maxlength="20"  value="<%=sjbh%>" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="fkxh"  value="<%=fkxh%>" >
					<input type="hidden" name="lrr" value="<%=yhmc%>">
					<input type="hidden" name="lrsj" value="<%=cf.today()%>">
					<input type="hidden" name="lrdw" value="<%=lrdw%>">
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">
                  <input type="button" value="�鿴�տ���Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
                  <input name="pr" type="button" value="��ӡ�վ�" onClick="window.open('/cwgl/qyecx/PrintQtSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')" >
                  <input name="pr2" type="button" value="ѡ���ӡ" onClick="window.open('/cwgl/qyecx/PrintChooseQtSj.jsp?fkxh=<%=fkxh%>')" >
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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
	cf.ajax(out);//����AJAX
%>


var lx;

function checkZkje(FormName) 
{
	if(FormName.fkje.value=="") 
	{
		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}


	if(FormName.zckx.value=="") 
	{
		return;
	}

	if (FormName.zckx.value=='21' )
	{
		if ("<%=mmbz%>"=="Y" || "<%=mmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='22' )
	{
		if ("<%=cgjjbz%>"=="Y" || "<%=cgjjbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='24')
	{
		if ("<%=jjbz%>"=="Y" || "<%=jjbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}

	lx=2;


	var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZckx(FormName) 
{

	if(FormName.fkje.value=="") 
	{

		FormName.zcgysbh.length=1;
		FormName.zckx.value="";

		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}

	if(FormName.zckx.value=="") 
	{
		return;
	}



	FormName.zcgysbh.length=1;


	if (FormName.zckx.value=='21' )
	{
		if ("<%=mmbz%>"=="M" )
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='22' )
	{
		if ("<%=cgjjbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='24')
	{
		if ("<%=jjbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else{
		lx=2;
		var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
	}

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	ajaxRetStr=ajaxRetStr.substring(14);

	if (lx==2)
	{
		if (ajaxRetStr!="")
		{
			alert(ajaxRetStr);
		}
	}
	else if (lx==3)
	{
		strToSelect(insertform.zcgysbh,ajaxRetStr);
	}
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.fklxbm)=="") {
		alert("��ѡ��[�տ�����]��");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zffs)=="") {
		alert("��ѡ��[֧����ʽ]��");
		FormName.zffs.focus();
		return false;
	}

	if (FormName.zffs.value=="31")//31��ת��
	{
		if(	javaTrim(FormName.zckx)=="") {
			alert("��ѡ��[ת�ʿ���]��");
			FormName.zckx.focus();
			return false;
		}
		if (FormName.zckx.value=="21" )//21:ľ�ţ�
		{
			if ("<%=mmbz%>"=="Y" || "<%=mmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת��ľ�ſ����ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="22" )//22:����
		{
			if ("<%=cgjjbz%>"=="Y" || "<%=cgjjbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת����������ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="23" )//23:���ģ�
		{
			if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת�����Ŀ����ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="24")//24���Ҿ�
		{
			if ("<%=jjbz%>"=="Y" || "<%=jjbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת���Ҿ߿����ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else{
			
			if(	javaTrim(FormName.zcgysbh)!="") {
				alert("δѡ��ת�����ɿ������ѡ��[ת��Ʒ��]��");
				FormName.zcgysbh.focus();
				return false;
			}
		}
	}
	else{
		FormName.zckx.value="";
		FormName.zcgysbh.value="";
	}


	if(	javaTrim(FormName.fkje)=="") {
		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "�տ���"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("����[�տ���]����Ϊ0");
		FormName.fkje.select();
		return false;
	}

	if(	javaTrim(FormName.skr)=="") {
		alert("������[�տ���]��");
		FormName.skr.focus();
		return false;
	}
	if(	javaTrim(FormName.sksj)=="") {
		alert("������[�տ�ʱ��]��");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "�տ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.skdw)=="") {
		alert("��ѡ��[�տλ]��");
		FormName.skdw.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
