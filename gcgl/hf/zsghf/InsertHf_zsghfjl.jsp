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

String khxm=null;
String hth=null;
String fwdz=null;
String lxfs=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sgbz=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String zjxm=null;
String bz=null;

String hflxbm=null;
String ysgcjdmc=null;
String ybysxmbm=null;
String zqysxmbm=null;
String sybgcrq=null;
String szqsj=null;
String fgsbh=null;
double sfke=0;
String qye=null;
String zkl=null;
String yhyy=null;
String khlxmc=null;
String dwbh=null;
String dwmc=null;
String sjjgrq=null;
String sjwjrq=null;

String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

String hfjlh=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

int tssl=0;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,ysgcjdmc,sjwjrq,sgbz,khxm,sfke,hth,fwdz,lxfs,hflxbm,kgrq,sjkgrq,jgrq,sgd,sjs,zjxm,qye,zkl,yhyy,khlxmc,sjjgrq,b.dwmc dwmc,crm_khxx.dwbh dwbh,crm_khxx.bz";
	ls_sql+=" ,crm_khxx.ybysxmbm,crm_khxx.zqysxmbm,crm_khxx.sybgcrq,crm_khxx.szqsj";
	ls_sql+=" from  crm_khxx,sq_dwxx b,dm_khlxbm,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=b.dwbh(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)  and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		fgsbh=rs.getString("fgsbh");
		sfke=rs.getDouble("sfke");
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		hflxbm=cf.fillHtml(rs.getString("hflxbm"));
		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));

		sjwjrq=cf.fillHtml(rs.getDate("sjwjrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));

		sgd=cf.fillHtml(rs.getString("sgd"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
        qye=cf.fillHtml(rs.getString("qye"));
		zkl=cf.fillHtml(rs.getString("zkl"));
		yhyy=cf.fillHtml(rs.getString("yhyy"));
		khlxmc=cf.fillHtml(rs.getString("khlxmc"));
	    sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
	    dwmc=cf.fillHtml(rs.getString("dwmc"));
	    dwbh=cf.fillHtml(rs.getString("dwbh"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//���̵����绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


//�ӳ��绰
	ls_sql=" select sgdmc,dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tssl=rs.getInt(1);
	}
	rs.close();
	ps.close();


	//�طü�¼��
	int count=0;
	ls_sql="select NVL(max(substr(hfjlh,8,3)),0)";
	ls_sql+=" from  hf_zsghfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	hfjlh=khbh+cf.addZero(count+1,3);
%>


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">

<form method="post" action="SaveInsertHf_zsghfjl.jsp" name="insertform">
  <div align="center">��ʩ���̻طã��طü�¼�ţ�<%=hfjlh%>�� </div>
  
<%
if (tssl>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCFFCC"  align="center">
		<td  width="9%">����ʱ��</td>
		<td  width="10%">����ʽ</td>
		<td  width="9%">�᰸״̬</td>
		<td  width="11%">���β��Ŵ���</td>
		<td  width="62%">Ͷ�߱�������</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT tsjlh,slsj,slfsmc,DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') clzt,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ڴ���','3','�ѽ��') zrbmclzt,tsnr";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[4]="align='left'";

//������ʾ��
	String[] disColName={"slsj","slfsmc","clzt","zrbmclzt","tsnr"};
	pageObj.setDisColName(disColName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("slsj",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�طü�¼��</td>
	<td  width="8%">�ط�����</td>
	<td  width="6%">�طý��</td>
	<td  width="16%">�ط�����</td>
	<td  width="5%">״̬</td>
	<td  width="5%">�ط���</td>
	<td  width="7%">�ط�ʱ��</td>
	<td  width="54%">�ط�˵��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	ls_sql="SELECT hf_zsghfjl.hfjlh,hflxmc,hfjgmc,hfwtmc,DECODE(hf_zsghfjl.wtclzt,'1','δ����','2','�ڴ���','3','�ѽ��'),hf_zsghfjl.hfr,hf_zsghfjl.hfsj,hf_zsghfjl.hfsm ";
	ls_sql+=" FROM hf_zsghfjl,dm_hfjgbm,dm_hfwtbm,dm_hflxbm  ";
    ls_sql+=" where hf_zsghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and hf_zsghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
    ls_sql+=" and hf_zsghfjl.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=" and hf_zsghfjl.khbh='"+khbh+"'";
    ls_sql+=" order by lrsj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hfjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="Viewhf_zsghfjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hfjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%>
</table>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>�ͻ�����</b>��</font><%=khxm%>��<%=lxfs%>��</td>
    <td colspan="2"><font color="#0000FF"><b>��ͬ��</b>��</font><%=hth%></td>
    <td width="26%"><font color="#0000CC"><b>�ͻ����</b>��</font><%=khbh%></td>
    <td width="24%"><font color="#0000FF"><b>��ϵ�ͻ�</b>��</font><%=khlxmc%></td>
  </tr>
  <tr> 
    <td colspan="4"><font color="#0000CC"><b>���ݵ�ַ</b>��</font><%=fwdz%></td>
    <td width="26%"><font color="#0000FF"><b>ǩԼ���</b>��</font><%=qye%>��<font color="#0000FF">�ۿ��ʣ�</font><%=zkl%>��</td>
    <td width="24%"><font color="#0000FF"><strong>��װʵ����</strong>��</font><%=sfke%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>���ʦ</b></font>����<%=dwmc%>��<%=sjs%>��<%=sjsdh%>��</td>
    <td colspan="2"><font color="#0000CC"><b>���̵���</b>��</font><%=zjxm%>��<%=zjdh%>��</td>
    <td width="26%"><font color="#0000CC"><b>ʩ����</b>��</font><%=sgdmc%>��<%=dzdh%>��</td>
    <td width="24%"><font color="#0000CC"><b>�೤</b>��</font><%=sgbz%>��<%=bzdh%>��</td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>Ӧ��������</b>��</font><%=kgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>Ӧ��������</b>��</font><%=jgrq%></td>
    <td colspan="2"><font color="#0000FF"><b>�Ż�����</b>��</font><%=yhyy%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>ʵ��������</b>��</font><%=sjkgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>ʵ��������</b>��</font><%=sjjgrq%></td>
    <td width="26%"><font color="#0000CC"><b>ʵ���������</b>��</font><%=sjwjrq%></td>
    <td width="24%"><font color="#0000CC"><b>���̽���</b>��</font><%=ysgcjdmc%> </td>
  </tr>
  <tr>
    <td colspan="6"><font color="#0000CC"><b>��ע</b>��</font><%=bz%></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">����������Ŀ</font></strong></td>
      <td bgcolor="#E8E8FF"><A HREF="/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>" target="_blank">
        <%cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where gcysxmbm='"+zqysxmbm+"'",zqysxmbm,true);%>
      </A></td>
      <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">��������ʱ��</font></strong></td>
      <td bgcolor="#E8E8FF"><%=szqsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���λط����� </td>
      <td><select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'",hflxbm);
%>
      </select></td>
      <td width="17%" rowspan="7" align="right">���ⲿ��</td>
      <td width="33%" rowspan="7">
        <select name="zrbm" style="FONT-SIZE:12PX;WIDTH:252PX" size="13" multiple>
          <option value=""></option>
          <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+fgsbh+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>�طý��</td>
      <td width="33%"><select name="hfjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ط�����</td>
      <td><select name="hfwtbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select hfwtbm,hfwtmc from dm_hfwtbm where hflxbm='24' order by hfwtbm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�´λط�����</td>
      <td>
	<select name="xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' and sfzdsz='2' order by hflxbm","");
%> 
      </select>	</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�´λط�����</td>
      <td><input type="text" name="xchfrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#000099">�ط���</font></td>
      <td><input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font><font color="#000099">�ط�ʱ��</font></td>
      <td width="33%"><input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ط�˵��</td>
      <td colspan="3"><textarea name="hfsm" cols="71" rows="6"></textarea></td>
    </tr>
  </table>

<%
	String bgcolor="#FFFFFF";
	
	
	//�طö���������
	String hfdxflbm=null;
	String hfdxflmc=null;
	ls_sql="select distinct hdm_hfdxflbm.hfdxflbm,hdm_hfdxflbm.hfdxflmc";
	ls_sql+=" from  hdm_hfxxsz,hdm_dxpjzb,hdm_hfdxbm,hdm_hfdxflbm";
	ls_sql+=" where hdm_hfxxsz.dxpjzbbm=hdm_dxpjzb.dxpjzbbm and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm ";
	ls_sql+=" and hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm";
	ls_sql+=" and hdm_hfxxsz.hflxbm='"+hflxbm+"' ";
	ls_sql+=" order by hdm_hfdxflbm.hfdxflbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hfdxflbm=cf.fillNull(rs.getString("hfdxflbm"));
		hfdxflmc=cf.fillNull(rs.getString("hfdxflmc"));


		%> 
  <BR><B><%=hfdxflmc%></B>
  <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="0" cellspacing="0">
	<tr align="center" bgcolor="#E8E8FF"> 
	  <td width="19%" bgcolor="#E8E8FF"><B>������Ա</B></td>
	  <td width="16%"><B>��������</B></td>
	  <td width="33%"><B>�������</B></td>
	  <td width="32%"><B>�������ԭ��</B></td>
	</tr>
      <%
		//�طö������
		int row=0;
		String hfdxbm=null;
		String hfdxmc=null;
		ls_sql="select distinct  hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc,hdm_hfdxbm.xh";
		ls_sql+=" from  hdm_hfxxsz,hdm_dxpjzb,hdm_hfdxbm";
		ls_sql+=" where hdm_hfxxsz.dxpjzbbm=hdm_dxpjzb.dxpjzbbm and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm ";
		ls_sql+="  and hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"' and hdm_hfxxsz.hflxbm='"+hflxbm+"' ";
		ls_sql+=" order by hdm_hfdxbm.xh ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			hfdxbm=cf.fillNull(rs1.getString("hfdxbm"));
			hfdxmc=cf.fillNull(rs1.getString("hfdxmc"));

			row++;
			if (row%2==1)
			{
				bgcolor="#FFFFFF";
			}
			else{
				bgcolor="#E8E8FF";
			}

			int sl=0;
			ls_sql="select count(*)";
			ls_sql+=" from  hdm_dxpjzb,hdm_hfxxsz";
			ls_sql+=" where hdm_dxpjzb.dxpjzbbm=hdm_hfxxsz.dxpjzbbm and hdm_dxpjzb.hfdxbm='"+hfdxbm+"' and hdm_hfxxsz.hflxbm='"+hflxbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				sl=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			//�طö�������ָ��
			String dxpjzbbm=null;
			String dxpjzb=null;
			ls_sql="select hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb";
			ls_sql+=" from  hdm_dxpjzb,hdm_hfxxsz";
			ls_sql+=" where hdm_dxpjzb.dxpjzbbm=hdm_hfxxsz.dxpjzbbm and hdm_dxpjzb.hfdxbm='"+hfdxbm+"' and hdm_hfxxsz.hflxbm='"+hflxbm+"'";
			ls_sql+=" order by hdm_dxpjzb.xh ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dxpjzbbm=cf.fillNull(rs2.getString("dxpjzbbm"));
				dxpjzb=cf.fillNull(rs2.getString("dxpjzb"));

				%>
				<tr align="center" bgcolor="<%=bgcolor%>"> 
				  <td rowspan="<%=sl%>">
					<%=hfdxmc%>
					<input type="hidden" name="hfdxbm"  value="<%=hfdxbm%>" >
				  </td>
				  <td>
					<%=dxpjzb%>
					<input type="hidden" name="dxpjzbbm"  value="<%=dxpjzbbm%>" >
				  </td>
				  <td>
<%
					String pfbm=null;
					String pfmc=null;
					ls_sql="select pfbm,pfmc";
					ls_sql+=" from  hdm_pjzbpf";
					ls_sql+=" where dxpjzbbm='"+dxpjzbbm+"'";
					ls_sql+=" order by xh ";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					while (rs3.next())
					{
						pfbm=cf.fillNull(rs3.getString("pfbm"));
						pfmc=cf.fillNull(rs3.getString("pfmc"));

						%>
						<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>"><%=pfmc%>
						<%
					}
					rs3.close();
					ps3.close();
%>
				  </td>
				  <td rowspan="<%=sl%>">
					<textarea name="bmyyy<%=hfdxbm%>" cols="40" rows="5"></textarea>
				  </td>
				</tr>
				<%

			}

			while (rs2.next())
			{
				dxpjzbbm=cf.fillNull(rs2.getString("dxpjzbbm"));
				dxpjzb=cf.fillNull(rs2.getString("dxpjzb"));

				%>
				<tr align="center" bgcolor="<%=bgcolor%>"> 
				  <td>
					<%=dxpjzb%>
					<input type="hidden" name="dxpjzbbm"  value="<%=dxpjzbbm%>" >
				  </td>
				  <td>
<%
					String pfbm=null;
					String pfmc=null;
					ls_sql="select pfbm,pfmc";
					ls_sql+=" from  hdm_pjzbpf";
					ls_sql+=" where dxpjzbbm='"+dxpjzbbm+"'";
					ls_sql+=" order by xh ";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					while (rs3.next())
					{
						pfbm=cf.fillNull(rs3.getString("pfbm"));
						pfmc=cf.fillNull(rs3.getString("pfmc"));

						%>
						<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>"><%=pfmc%>
						<%
					}
					rs3.close();
					ps3.close();
%>
				  </td>
				</tr>
				<%

			}
			rs2.close();
			ps2.close();

		
		}
		rs1.close();
		ps1.close();

		%> 
  </table>
    <%

	
	
	}
	rs.close();
	ps.close();
	
%> 
  </table>

  <P>
  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="2%">&nbsp</td>
	  <td>
<%
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	String sftxsm=null;
	String txsmts=null;
	ls_sql="select hdm_hfwt.wtbh,wtmc,sfkdx,yxbz,fbsj,sftxsm,txsmts ";
	ls_sql+=" from  hdm_hfwt,hdm_hfwtsz";
	ls_sql+=" where  hdm_hfwt.wtbh=hdm_hfwtsz.wtbh and hdm_hfwt.yxbz='Y' and hdm_hfwtsz.hflxbm='"+hflxbm+"'";
	ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));//�Ƿ�ɶ�ѡ ,1����ѡ��2����ѡ��3��д˵��
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		sftxsm=cf.fillNull(rs.getString("sftxsm"));//Y������N��������
		txsmts=cf.fillNull(rs.getString("txsmts"));

		%>
		<P><B><%=wtbh%>��<%=wtmc%></B>
		<%


		if (sfkdx.equals("3"))//1����ѡ��2����ѡ��3��д˵��
		{
			%>
			<BR>
				<textarea name="wtbh<%=wtbh%>" cols="92" rows="3"></textarea>
			<%
		}
		else{
			String dabh=null;
			String damc=null;
			String sfyxsm=null;
			ls_sql="select dabh,damc,sfyxsm";
			ls_sql+=" from  hdm_hfwtda";
			ls_sql+=" where  wtbh="+wtbh;
			ls_sql+=" order by dabh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				dabh=cf.fillNull(rs1.getString("dabh"));
				damc=cf.fillNull(rs1.getString("damc"));
				sfyxsm=cf.fillNull(rs1.getString("sfyxsm"));//Y������N��������
				
				if (sfkdx.equals("1"))//1����ѡ��2����ѡ��3��д˵��
				{
					%>
					<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>��
					<input type="checkbox" name="wtbh<%=wtbh%>" value="<%=dabh%>">
					<%=damc%>
					<%

					if (sfyxsm.equals("Y"))
					{
						%>
						&nbsp;&nbsp;��˵��ԭ��
						<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
						<%
					}
				}
				else if (sfkdx.equals("2"))
				{
					%>
					<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>��
					<input type="radio" name="wtbh<%=wtbh%>" value="<%=dabh%>">
					<%=damc%>
					<%
					if (sfyxsm.equals("Y"))
					{
						%>
						&nbsp;&nbsp;��˵��ԭ��
						<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
						<%
					}
				}
			}
			rs1.close();
			ps1.close();

			if (sftxsm.equals("Y"))//�Ƿ�������д˵��
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=txsmts%>��
				<input type="text" name="w<%=wtbh%>" size="100" maxlength="200" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
				<%
			}
		}

	}
	rs.close();
	ps.close();
%>
  
	</td>
	</tr>
  </table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
      <td colspan="14"> 
        <input type="hidden" name="hfjlh"  value="<%=hfjlh%>" >
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3 != null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.hfjgbm)=="") {
		alert("������[�طý��]��");
		FormName.hfjgbm.focus();
		return false;
	}
	if (FormName.hfjgbm.value=="02")
	{
		if(	javaTrim(FormName.hfwtbm)=="") {
			alert("������[�ط�����]��");
			FormName.hfwtbm.focus();
			return false;
		}
		if(	javaTrim(FormName.hfsm)=="") {
			alert("������[�ط�˵��]��");
			FormName.hfsm.focus();
			return false;
		}

		if (!selectChecked(FormName.zrbm)){
			alert("��ѡ��[���ⲿ��]��");
			FormName.zrbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.hfwtbm)!="") {
			alert("����Ҫ����[�ط�����]��");
			FormName.hfwtbm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.hfr)=="") {
		alert("������[�ط���]��");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("������[�ط�ʱ��]��");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.xchflxbm)!="")
	{
		if(	javaTrim(FormName.xchfrq)=="") {
			alert("��ѡ��[�´λط�����]��");
			FormName.xchfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfrq, "�´λط�����"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xchfrq)!="") {
			alert("���󣡡��´λط����͡�Ϊ�գ���������[�´λط�����]��");
			FormName.xchfrq.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
