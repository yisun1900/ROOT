<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String dqbm=null;

String jc_mmydd_khxm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sqdj=null;
String sgd="";
String bzdh="";
String lxfs=null;
String sgbz=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String htrq=null;
String dwmc=null;
String sjs=null;
String hth=null;
String cxhdbm=null;
String pdgc=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String htbz=null;
double fwf=0;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;
double htje=0;
double zqmmhtje=0;
double zqwjhtje=0;
double zqblhtje=0;
double wdzje=0;
double mmzkl=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sq_dwxx.dqbm,crm_khxx.fgsbh,jc_mmydd.xmzy,crm_khxx.khxm,jhazsj,sqdj,htrq";
	ls_sql+=" ,sgd,sgbz,dwmc,sjs,hth,cxhdbm,pdgc,lxfs,fwdz,jc_mmydd.htbz";
	ls_sql+=" ,fwf,mmhtje,wjhtje,blhtje,htje,zqmmhtje,zqwjhtje,zqblhtje,wdzje ,mmzkl";
	ls_sql+=" from  jc_mmydd,crm_khxx,sq_dwxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+)  and yddbh='"+yddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("sqdj"));
		htrq=cf.fillNull(rs.getDate("htrq"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		htbz=cf.fillNull(rs.getString("htbz"));

		fwf=rs.getDouble("fwf");
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		htje=rs.getDouble("htje");

		zqmmhtje=rs.getDouble("zqmmhtje");
		zqwjhtje=rs.getDouble("zqwjhtje");
		zqblhtje=rs.getDouble("zqblhtje");
		wdzje=rs.getDouble("wdzje");
		mmzkl=rs.getDouble("mmzkl");
	}
	rs.close();
	ps.close();

	wdzje=cf.round(wdzje,0);

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>�����ڴ�ľ��ȷ�ϱ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="100%" > 
        <table width="100%" border="0" style='FONT-SIZE: 20px'>
          <tr> 
            <td width="40%"><strong>�����ţ�<%=yddbh%></strong></td>
            <td width="60%"><strong>Ԫ �� ľ �� �� ͬ �� ��</strong></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr> 
    <td> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="391" scope="row">�ͻ�������<%=jc_mmydd_khxm%></td>
          <td  scope="row">��װ��ͬ�ţ�<%=hth%> </td>
          <td width="293" scope="row">�ƻ���Ʒ�������ڣ�<%=jc_mmydd_jhazsj%></td>
        </tr>
        <tr>
          <td width="308" scope="row"> 
            <div align="left">��ϵ��ʽ��<%=lxfs%> </div>
          </td>
          <td width="284">ʩ���೤��<%=sgbz%><%=bzdh%></td>
          <td width="284">ǩԼ����/��װ���ʦ��<%=dwmc%>/<%=sjs%></td>
        </tr>
        <tr> 
          <td width="391" scope="row">��ַ��<%=fwdz%></td>
          <td width="308" scope="row"> 
            <div align="left">���湤��(<%=pdgc%>)��¼��</div>
          </td>
          <td width="284">�μӴ������<%=cxhdbm%></td>
        </tr>
        <tr>
          <td width="391" scope="row">��ĿרԱ��<%=xmzy%></td>
          <td width="308" scope="row">��ĿרԱ�绰��<%=xmzydh%></td>
          <td width="284">&nbsp;</td>
        </tr>
      </table>
      <b style='FONT-SIZE: 14px'>ľ��Ʒ����</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="2%">&nbsp;</td>
          <td  width="5%">��ʽ</td>
          <td  width="7%">��������</td>
          <td  width="6%">��װλ��</td>
          <td  width="4%">��˫��</td>
          <td  width="22%">��ɫ<����></td>
          <td  width="7%">�ز�����</td>
          <td  width="10%">�Ŷ�(��*��*��)��mm��</td>
          <td  width="4%">���ȿ�mm</td>
          <td  width="7%">�۸�(Ԫ)</td>
          <td  width="8%">��������</td>
          <td  width="18%">��ע</td>
        </tr>

<%
	String mmdglxbm=null;
	String mmdglxmc=null;
	String mmxh=null;
	String azwzmc=null;
	String kqfxmc=null;
	String dsk=null;
	String czmc=null;
	String dczlmc=null;
	String md=null;
	String mdk=null;
	String mdg=null;
	String qh=null;
	String ms=null;
	String bzdj=null;
	String dj=null;
	double zqzj=0;
	double zj=0;
	double allzqzj=0;
	double allzj=0;
	String sfsmjcc=null;
	String blxh=null;
	String ysbm=null;
	String mmczmc=null;
	String sfydc=null;
	String ctbs=null;
	String tjx=null;
	String zp=null;
	String bz=null;
	String mtxmc=null;
	String mxxmc=null;
	String sl=null;

	int row=0;
	ls_sql="SELECT jc_mmdgdmx.mmdglxbm,mmdglxmc,jc_mmdgdmx.ysbm,mmczmc,jc_mmdgdmx.mmxh,azwzmc,kqfxmc,mtxmc,mxxmc,DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��') dsk,czmc";
	ls_sql+=" ,dczlmc||'('||jc_mmdgdmx.dbh||')' dczlmc,jc_mmdgdmx.mdk,jc_mmdgdmx.mdg,jc_mmdgdmx.qh,jc_mmdgdmx.sl";
	ls_sql+=" ,TO_CHAR(jc_mmdgdmx.mdk-95) ms,jc_mmdgdmx.sl*jc_mmdgdmx.bzdj zqzj,jc_mmdgdmx.sl*jc_mmdgdmx.dj zj,jc_mmdgdmx.bzdj,jc_mmdgdmx.dj,blxh,jc_mmdgdmx.bz ";
	ls_sql+=" ,DECODE(jc_mmdgdmx.sfsmjcc,'Y','��ľ���ɲ�;','N','') sfsmjcc,jc_mmxhb.zp,jc_mmdgdmx.sfydc,jc_mmdgdmx.ctbs,jc_mmdgdmx.tjx";
	ls_sql+=" FROM dm_czbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm,jdm_mmczbm,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.yddbh='"+yddbh+"'  and jc_mmdgdmx.lx='1'";
    ls_sql+=" and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mmdglxmc=cf.fillNull(rs.getString("mmdglxmc"));
		mmxh=cf.fillHtml(rs.getString("mmxh"));
		azwzmc=cf.fillHtml(rs.getString("azwzmc"));
		kqfxmc=cf.fillHtml(rs.getString("kqfxmc"));
		mtxmc=cf.fillNull(rs.getString("mtxmc"));
		mxxmc=cf.fillNull(rs.getString("mxxmc"));
		dsk=cf.fillHtml(rs.getString("dsk"));
		czmc=cf.fillHtml(rs.getString("czmc"));
		dczlmc=cf.fillHtml(rs.getString("dczlmc"));
		mdk=cf.fillHtml(rs.getString("mdk"));
		mdg=cf.fillHtml(rs.getString("mdg"));
		qh=cf.fillHtml(rs.getString("qh"));
		ms=cf.fillHtml(rs.getString("ms"));
		bzdj=cf.fillHtml(rs.getString("bzdj"));
		dj=cf.fillHtml(rs.getString("dj"));
		zqzj=rs.getDouble("zqzj");
		zj=rs.getDouble("zj");
		sfsmjcc=cf.fillHtml(rs.getString("sfsmjcc"));
		blxh=cf.fillHtml(rs.getString("blxh"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		mmczmc=cf.fillNull(rs.getString("mmczmc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		zp=cf.fillHtml(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		sl=cf.fillNull(rs.getString("sl"));

		allzj+=zj;
		allzqzj+=zqzj;



		if (sfydc.equals("Y"))//Y���ж�����N���޶���
		{
			bz="�ж���;"+bz;
		}
		if (ctbs.equals("3"))//3�����ߣ�4���ı�
		{
			bz="����/��������;"+bz;
		}
		else if (ctbs.equals("4"))//3�����ߣ�4���ı�
		{
			bz="����/�����ı�;"+bz;
		}
		if (ysbm.equals("14") || ysbm.equals("15"))//14:�׻����ף���������;15:�������ף��׻�����
		{
			bz=mmczmc+";"+bz;
		}

		if (!mtxmc.equals(""))
		{
			bz=mtxmc+";"+bz;
		}
		if (!mxxmc.equals(""))
		{
			bz=mxxmc+";"+bz;
		}
		if (bz.equals(""))
		{
			bz="&nbsp;";
		}

//		bz="<font size='2'>"+bz+"</font>";

		row++;

		
		if (mmdglxbm.equals("01"))//01:������
		{
			md=mdk+"*"+mdg+"*"+qh;
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td><%=mmxh%></td>
			  <td><%=kqfxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%>��</td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("41"))//41:�߽���
		{
			md="����"+tjx;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%>����</td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>/����</td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("51"))//51:���ǣ��۽ǡ�������
		{
			md="��:"+mdk+"����:"+mdg;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("42"))//42:��Ʈ����ƽ̨�Ͽ�
		{
			md="��:"+mdk+"����:"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else if (mmdglxbm.equals("15") || mmdglxbm.equals("16"))//15:˫����Ʈ��������;//16:������Ʈ��������
		{
			md="��:"+mdg+"����:"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}
		else{
			md=mdk+"*"+mdg+"*"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><B><%=czmc%></B><<%=mmczmc%>></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td><%=bzdj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();

	if (cf.round(allzj,0)!=cf.round(mmhtje,0))
	{
		out.println("<BR><font color=\"#FF0000\">��ľ�ź�ͬ���-�ۺ󡿴�������ͬ����ϸ��һ�£�����ͬ["+cf.round(mmhtje,0)+"]����ϸ["+cf.round(allzj,0)+"]</font>");
		return;
	}

	if (cf.round(allzqzj,0)!=cf.round(zqmmhtje,0))
	{
		out.println("<BR><font color=\"#FF0000\">��ľ�ź�ͬ���-��ǰ����������ͬ����ϸ��һ�£�����ͬ["+cf.round(zqmmhtje,0)+"]����ϸ["+cf.round(allzqzj,0)+"]</font>");
		return;
	}
%> 
		<tr align="center"> 
		  <td colspan="6"><ľ��Ʒ����>����ܼƣ�<%=cf.formatDouble(allzqzj)%>Ԫ</td>
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
%> <b style='FONT-SIZE: 14px'>����ಿ��</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="4%">���</td>
          <td  width="20%">����</td>
          <td  width="12%">Ʒ��</td>
          <td  width="12%">�ͺ�</td>
          <td  width="8%">��λ</td>
          <td  width="8%">����</td>
          <td  width="8%">����</td>
          <td  width="10%">�� ��</td>
          <td  width="20%">��ע</td>
        </tr>
        <%

	ls_sql="SELECT rownum,wjmc,wjjmc,jc_wjjddmx.xinghao,jldw,TO_CHAR(jc_wjjddmx.bzdj),jc_wjjddmx.sl,jc_wjjddmx.sl*jc_wjjddmx.bzdj,jc_wjjddmx.bz";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm ";
    ls_sql+=" where  jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
	ls_sql+=" and jc_wjjddmx.lx='1'";
    ls_sql+=" order by rownum";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();

%> 
      </table>
      <b style='FONT-SIZE: 14px'>��������</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="5%">���</td>
          <td  width="25%">�����ͺ�</td>
          <td  width="10%">������;</td>
          <td  width="10%">����</td>
          <td  width="10%">��������</td>
          <td  width="10%">���</td>
          <td  width="32%">��ע</td>
        </tr>
        <%

	ls_sql="SELECT rownum,blxh,blyt,TO_CHAR(jc_blddmx.bzdj) as jc_blddmx_dj,jc_blddmx.sl as jc_blddmx_sl,jc_blddmx.bzdj*jc_blddmx.sl je,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jdm_blytbm  ";
    ls_sql+=" where jc_blddmx.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blddmx.yddbh='"+yddbh+"' and jc_blddmx.lx='1'";
    ls_sql+=" order by rownum";
    pageObj.sql=ls_sql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();

%> 
      </table>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr valign="top"> 
    <td height="42">��ע��<%=htbz%></td>
  </tr>
  <tr> 
    <td height="3">������ʾ�������������Ǹ���ľ�ذ壬1.5m��Χ�ڵ�������2--3mm������Ե��������ƽ����</td>
  </tr>
</table>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
<%
if (mmzkl!=10)
{
	%>
	  <tr> 
		<td width="36%" height="2">�ۼƽ��(��ǰ)��<%=cf.formatDouble(wdzje)%>Ԫ��Сд��</td>
		<td width="35%" height="2">�ۼƽ��(�ۺ�)��<%=cf.formatDouble(htje)%>Ԫ��Сд��</td>
		<td width="29%" height="2">ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</td>
	  </tr>
	  <tr> 
		<td>����д����<%=cf.NumToRMBStr(wdzje)%></td>
		<td>����д����<%=cf.NumToRMBStr(htje)%></td>
		<td>&nbsp;</td>
	  </tr>
	<%
}
else{
	%>
	  <tr> 
		
    <td width="36%" height="2">�ۼƽ�<%=cf.formatDouble(htje)%>Ԫ��Сд��</td>
    <td width="35%" height="2">ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</td>
    <td width="29%" height="2">&nbsp;</td>
	  </tr>
	  <tr> 
		
    <td>����д����<%=cf.NumToRMBStr(htje)%></td>
    <td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	<%
}
%>
  <tr> 
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="36%" >�ͻ�ǩ�֣�</td>
          <td width="64%" >�����ˣ�</td>
        </tr>
        <tr> 
          <td >ǩ�����ڣ�<%=htrq%></td>
          <td >ǩ�����ڣ�<%=htrq%></td>
        </tr>
      </table>    </td>
  </tr>
</table>
</body>
</html>




