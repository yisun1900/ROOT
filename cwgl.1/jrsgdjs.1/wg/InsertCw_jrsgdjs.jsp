<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE6 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
String zjxxh=null;
int fwmj=0;

double zqgczjf=0;
double zjxje=0;

double jsglk=0;
double cfje=0;

double bcflk=0;
double kzbjbl=0;
double kzbj=0;

double rgfbfb=0;
double yfrgf=0;
double bcrgf=0;

double bcfkhj=0;

double ysglk=0;
double yscfje=0;
double ysfwmjcz=0;
double ysclfbfb=0;

double sgdzbj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fwmj,gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm";
	ls_sql+=" ,zqgczjf,zjxje,crm_khxx.bjjb,bjjbmc,sgebfb,zjxxh";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fwmj=rs.getInt("fwmj");
		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgebfb=rs.getDouble("sgebfb");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (gdjsjd.equals("8"))//A:���Ե�һ�β�����
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
	}


	ls_sql="select clfbfb,cfje,fwmjcz,ysglk";
	ls_sql+=" from cw_cflkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysclfbfb=rs.getDouble("clfbfb");
		yscfje=rs.getDouble("cfje");
		ysfwmjcz=rs.getDouble("fwmjcz");
		ysglk=rs.getDouble("ysglk");
	}
	rs.close();
	ps.close();

	clf=(ysglk-yscfje)*ysclfbfb/100+ysfwmjcz;
	clf=cf.round(clf,2);

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	//������
	if (!zjxxh.equals(""))
	{
		ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and bj_bjxmmxh.xmxlbm in('0101','0601')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			cfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (cfje<=400)
		{
			cfje=0;
		}
	}
	else{
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.xmxlbm in('0101','0601')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			cfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (cfje<=400)
		{
			cfje=0;
		}
	}

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		ls_sql="select tcsgze ";
		ls_sql+=" from  crm_tckhqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("tcsgze");
		}
		rs.close();
		ps.close();

		if (!zjxxh.equals(""))
		{
			//1�������ࣨ�������շ���Ŀ��أ���2�������ࣨ�������շ���Ŀ�޹أ���3��������
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				jsglk=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			jsglk=zqgczjf;
		}


		zjxje=cf.round(jsglk-zqgczjf,2);
	}
	else{
		jsglk=cf.round(zqgczjf+zjxje,2);
	}

	bcflk=cf.round((jsglk-cfje)*sgebfb/100+ysfwmjcz-clf,2);


	ls_sql="select zbj,rgfbfb";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzbj=rs.getDouble("zbj");
		rgfbfb=rs.getDouble("rgfbfb");
	}
	rs.close();
	ps.close();

	if (sgdzbj<=40000)
	{
		kzbjbl=4;
	}
	else if (sgdzbj>40000 && sgdzbj<=100000)
	{
		kzbjbl=3;
	}
	else if (sgdzbj>100000)
	{
		kzbjbl=0;
	}

	kzbj=cf.round(jsglk*kzbjbl/100,2);


	if (sgdzbj>=100000)
	{
		kzbj=0;
	}
	else if ((sgdzbj+kzbj)>=100000)
	{
		kzbj=100000-sgdzbj;
	}


	ls_sql="select sum(bcrgf)";
	ls_sql+=" from  cw_jrbgf";
	ls_sql+=" where khbh='"+khbh+"' and clzt!='3'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfrgf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	bcrgf=cf.round(jsglk*rgfbfb/100+cfje*0.24-yfrgf,2);

	bcfkhj=bcrgf-kzbj;





	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_jrsgdjs";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<div align="center">ʩ�����깤����</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����¼��</td>
	<td  width="8%">Ԥ�㹤�Ͽ�</td>
	<td  width="5%">�˹��Ѱٷֱ�</td>
	<td  width="8%">�Ѹ��˹���</td>
	<td  width="8%">����Ӧ���˹���</td>
	<td  width="7%">����</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="40%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_jrbgf.jsjlh,TO_CHAR(cw_jrbgf.ysglk),cw_jrbgf.rgfbfb||'%',TO_CHAR(cw_jrbgf.yfrgf),cw_jrbgf.bcrgf,gdjsjdmc, DECODE(cw_jrbgf.clzt,'1','����','2','����ͬ��','3','������ͬ��'),cw_jrbgf.lrr,cw_jrbgf.lrsj,cw_jrbgf.bz ";
	ls_sql+=" FROM cw_jrbgf,dm_gdjsjd  ";
    ls_sql+=" where cw_jrbgf.lx=dm_gdjsjd.gdjsjd(+) and cw_jrbgf.khbh='"+khbh+"'";
	ls_sql+=" order by cw_jrbgf.jsjlh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();

%>
</table>

<form method="post" action="SaveInsertCw_jrsgdjs.jsp" name="insertform"  >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%> </td>
    <td align="right">���ڽ������</td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><span class="STYLE1">���ۼ���</span></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjkgrq%> </td>
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����¼��</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�ͻ����</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">�ֳ�������</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">Ԥ�㹤�Ͽ�</span></td> 
  <td width="32%"><input type="text" name="ysglk" value="<%=ysglk%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">����ʩ����</span></td> 
  <td width="32%"> 
    <input type="text" name="zjsge" value="<%=zjxje%>" size="20" maxlength="17" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">������</span></td> 
  <td width="32%"> 
    <input type="text" name="cfje" value="<%=cfje%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">���㹤�Ͽ�</span></td>
  <td><input type="text" name="jsglk" value="<%=jsglk%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�˹��Ѱٷֱ�</td> 
  <td width="32%"><input type="text" name="rgfbfb" value="<%=rgfbfb%>" size="10" maxlength="9" onChange="calValue(insertform)">
    %</td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">�Ѹ��˹���</span></td> 
  <td width="32%"><input type="text" name="yfrgf" value="<%=yfrgf%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">����Ӧ���˹���</span></td> 
  <td width="32%"><input type="text" name="bcrgf" value="<%=bcrgf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���Ͽ�ٷֱ�</span></td> 
  <td width="32%"> 
    <input type="text" name="flkbfb" value="<%=sgebfb%>" size="10" maxlength="9" readonly>
    %  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">�ѳ帨�Ͽ�</span></td> 
  <td width="32%"> 
    <input type="text" name="ycflk" value="<%=clf%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">����Ӧ���˸��Ͽ�</span></td> 
  <td width="32%"> 
    <input type="text" name="bcflk" value="<%=bcflk%>" size="20" maxlength="17" readonly></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>�ۼ����Ͽ�</td> 
  <td width="32%"><input type="text" name="kjflk" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��˾����</td>
  <td><input type="text" name="gsfl" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>���͸���</td>
  <td><input type="text" name="psfl" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="28" align="right">ʩ�����ʱ���</td>
  <td><%=sgdzbj%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���ʱ������</span></td> 
  <td width="32%"><p>
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" readonly>
    % </p>    </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���ʱ���</span></td> 
  <td width="32%"><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���ر���</td>
  <td><input type="text" name="bx" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>��Ա����</td>
  <td><input type="text" name="rybx" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�⳥��</td>
  <td><input type="text" name="pck" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>����</td>
  <td><input type="text" name="fk" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��������</td> 
  <td width="32%"><input type="text" name="kqtk" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������˵��</td> 
  <td colspan="3"> 
    <input type="text" name="kqtksm" value="" size="74" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���θ���ϼ�</span></td> 
  <td colspan="3"> 
    <input type="text" name="bcfkhj" value="<%=cf.round(bcfkhj,0)%>" size="20" maxlength="17" readonly>
    <span class="STYLE6">���θ���ϼ�</span><span class="STYLE6">=����Ӧ���˹���-��˾����-���͸���-���ʱ���-���ر���-��Ա����-�⳥��-����-��������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	var bcflk=0;
	bcflk=(FormName.jsglk.value*1.0-FormName.cfje.value*1.0)*FormName.flkbfb.value/100+<%=ysfwmjcz%>-FormName.ycflk.value*1.0+FormName.kjflk.value*1.0;
	FormName.bcflk.value=round(bcflk,2);

	var bcrgf=FormName.jsglk.value/100*FormName.rgfbfb.value+FormName.cfje.value*0.24-FormName.yfrgf.value;
	FormName.bcrgf.value=round(bcrgf,2);

	var bcfkhj=FormName.bcrgf.value*1.0-FormName.gsfl.value*1.0-FormName.psfl.value*1.0-FormName.kzbj.value*1.0-FormName.kqtk.value*1.0-FormName.fk.value*1.0-FormName.bx.value*1.0-FormName.rybx.value*1.0-FormName.pck.value*1.0;
	FormName.bcfkhj.value=round(bcfkhj,0);

//	���θ���ϼ�=����Ӧ���˹���-��˾����-���͸���-���ʱ���-���ر���-��Ա����-�⳥��-����-��������
	
} 
 
  
//bcrgf=cf.round(jsglk*rgfbfb/100+cfje*0.24-yfrgf,2);

//+FormName.bcflk.value*1.0

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.ysglk)=="") {
		alert("������[Ԥ�㹤�Ͽ�]��");
		FormName.ysglk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysglk, "Ԥ�㹤�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjsge)=="") {
		alert("������[����ʩ����]��");
		FormName.zjsge.focus();
		return false;
	}
	if(!(isFloat(FormName.zjsge, "����ʩ����"))) {
		return false;
	}
	if(	javaTrim(FormName.cfje)=="") {
		alert("������[������]��");
		FormName.cfje.focus();
		return false;
	}
	if(!(isFloat(FormName.cfje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jsglk)=="") {
		alert("������[���㹤�Ͽ�]��");
		FormName.jsglk.focus();
		return false;
	}
	if(!(isFloat(FormName.jsglk, "���㹤�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("������[�˹��Ѱٷֱ�]��");
		FormName.rgfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfbfb, "�˹��Ѱٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yfrgf)=="") {
		alert("������[�Ѹ��˹���]��");
		FormName.yfrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfrgf, "�Ѹ��˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.kjflk)=="") {
		alert("������[�ۼ����Ͽ�]��");
		FormName.kjflk.focus();
		return false;
	}
	if(!(isFloat(FormName.kjflk, "�ۼ����Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bcrgf)=="") {
		alert("������[����Ӧ���˹���]��");
		FormName.bcrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.bcrgf, "����Ӧ���˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.flkbfb)=="") {
		alert("������[���Ͽ�ٷֱ�]��");
		FormName.flkbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.flkbfb, "���Ͽ�ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycflk)=="") {
		alert("������[�ѳ帨�Ͽ�]��");
		FormName.ycflk.focus();
		return false;
	}
	if(!(isFloat(FormName.ycflk, "�ѳ帨�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bcflk)=="") {
		alert("������[����Ӧ���˸��Ͽ�]��");
		FormName.bcflk.focus();
		return false;
	}
	if(!(isFloat(FormName.bcflk, "����Ӧ���˸��Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfl)=="") {
		alert("������[��˾����]��");
		FormName.gsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfl, "��˾����"))) {
		return false;
	}
	if(	javaTrim(FormName.psfl)=="") {
		alert("������[���͸���]��");
		FormName.psfl.focus();
		return false;
	}
	if(!(isFloat(FormName.psfl, "���͸���"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("������[���ʱ������]��");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("������[���ʱ���]��");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.fk)=="") {
		alert("������[����]��");
		FormName.fk.focus();
		return false;
	}
	if(!(isFloat(FormName.fk, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.bx)=="") {
		alert("������[���ر���]��");
		FormName.bx.focus();
		return false;
	}
	if(!(isFloat(FormName.bx, "���ر���"))) {
		return false;
	}
	if(	javaTrim(FormName.rybx)=="") {
		alert("������[��Ա����]��");
		FormName.rybx.focus();
		return false;
	}
	if(!(isFloat(FormName.rybx, "��Ա����"))) {
		return false;
	}
	if(	javaTrim(FormName.pck)=="") {
		alert("������[�⳥��]��");
		FormName.pck.focus();
		return false;
	}
	if(!(isFloat(FormName.pck, "�⳥��"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("������[��������]��");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bcfkhj)=="") {
		alert("������[���θ���ϼ�]��");
		FormName.bcfkhj.focus();
		return false;
	}
	if(!(isFloat(FormName.bcfkhj, "���θ���ϼ�"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
