<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����ڴ�ľ��ȷ�ϱ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">

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
String ccsm=null;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;
double fwf=0;
double wdzje=0;
double htje=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sq_dwxx.dqbm,crm_khxx.fgsbh,jc_mmydd.xmzy,crm_khxx.khxm,jhazsj,sqdj,htrq,mmhtje,wjhtje,blhtje,sgd,sgbz,fwf,wdzje,htje,dwmc,sjs,hth,cxhdbm,pdgc,lxfs,fwdz,jc_mmydd.ccsm";
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
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		fwf=rs.getDouble("fwf");
		wdzje=rs.getDouble("wdzje");
		htje=rs.getDouble("htje");
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		ccsm=cf.fillNull(rs.getString("ccsm"));
	}
	rs.close();
	ps.close();

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


<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="100%" > 
		<div align="center"><strong>Ԫ �� ľ �� �� �� ��</strong></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="391" scope="row">�ͻ�������<%=jc_mmydd_khxm%></td>
          <td  scope="row">��װ��ͬ�ţ�<%=hth%> </td>
          <td width="293" scope="row">�μӴ������<%=cxhdbm%></td>
        </tr>
        <tr> 
          <td width="308" scope="row"> 
            <div align="left">��ϵ��ʽ��<%=lxfs%> </div>
          </td>
          <td width="284">ʩ���೤��<%=sgbz%><%=bzdh%></td>
          <td width="284">��ĿרԱ��<%=xmzy%>��<%=xmzydh%>��</td>
        </tr>
        <tr> 
          <td width="391" scope="row">��ַ��<%=fwdz%></td>
          <td colspan="2" scope="row"> 
            <div align="left">ǩԼ����/��װ���ʦ��<%=dwmc%>/<%=sjs%></div>
          </td>
        </tr>
      </table>
      <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="2%">&nbsp;</td>
          <td  width="6%">��ʽ</td>
          <td  width="7%">��������</td>
          <td  width="7%">��װλ��</td>
          <td  width="4%">��˫��</td>
          <td  width="24%">��ɫ<����></td>
          <td  width="7%">�ز�����</td>
          <td  width="10%">�Ŷ�(��*��*��)��mm��</td>
          <td  width="4%">���ȿ�mm</td>
          <td  width="9%">�۸�(Ԫ)</td>
          <td  width="8%">��������</td>
          <td  width="12%">��ע</td>
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
	double zj=0;
	String dj=null;
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
	ls_sql="SELECT jc_mmccd.mmdglxbm,mmdglxmc,jc_mmccd.ysbm,mmczmc,jc_mmccd.mmxh,azwzmc,kqfxmc,mtxmc,mxxmc,DECODE(jc_mmccd.dsk,'1','����','2','˫��') dsk,czmc";
	ls_sql+=" ,dczlmc||'('||jc_mmccd.dbh||')' dczlmc,jc_mmccd.mdk,jc_mmccd.mdg,jc_mmccd.qh,jc_mmccd.sl";
	ls_sql+=" ,TO_CHAR(jc_mmccd.mdk-95) ms,jc_mmccd.sl*jc_mmccd.dj zj,jc_mmccd.dj,blxh,jc_mmccd.bz ";
	ls_sql+=" ,DECODE(jc_mmccd.sfsmjcc,'Y','��ľ���ɲ�;','N','') sfsmjcc,UPPER(jc_mmxhb.zp) zp,jc_mmccd.sfydc,jc_mmccd.ctbs,jc_mmccd.tjx";
	ls_sql+=" FROM dm_czbm,jc_mmdglx,jc_mmccd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm,jdm_mmczbm,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmccd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmccd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmccd.czbm=dm_czbm.czbm(+)";
	ls_sql+=" and jc_mmccd.mmxh=jc_mmxhb.mmxh(+) and jc_mmccd.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmccd.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
    ls_sql+=" and  jc_mmccd.mlx=jdm_mlx.mlx(+) and jc_mmccd.yddbh='"+yddbh+"' ";
    ls_sql+=" and jc_mmccd.ysbm=jdm_mmczbm.mmczbm(+) and jc_mmccd.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmccd.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmccd.xh";
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
		zj=rs.getDouble("zj");
		dj=cf.fillHtml(rs.getString("dj"));
		sfsmjcc=cf.fillHtml(rs.getString("sfsmjcc"));
		blxh=cf.fillHtml(rs.getString("blxh"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		mmczmc=cf.fillNull(rs.getString("mmczmc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		sl=cf.fillNull(rs.getString("sl"));

		allzj+=zj;

		if (zp.equals(""))
		{
			zp="&nbsp;";
		}
		else{
			zp="<IMG SRC=\"/jcjj/mmxh/images/"+zp+"\" height=150>";
		}



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
			  <td><%=dj%>*<%=sl%>��</td>
			  <td><%=blxh%></td>
			  <td align="left"><%=zp%></td>
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
			  <td><%=dj%>/����</td>
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
			  <td><%=dj%>*<%=sl%></td>
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
			  <td><%=dj%>*<%=sl%></td>
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
			  <td><%=dj%>*<%=sl%></td>
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
			  <td><%=dj%>*<%=sl%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=sfsmjcc%><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();
%> 
		<tr align="center"> 
		  <td colspan="6"><b><ľ��Ʒ����>����ܼƣ�<%=cf.formatDouble(allzj)%>Ԫ</b></td>
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

      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr valign="top"> 
    <td height="42">��ע��<%=ccsm%></td>
  </tr>
  <tr> 
    <td height="3">������ʾ�������������Ǹ���ľ�ذ壬1.5m��Χ�ڵ�������2--3mm������Ե��������ƽ����</td>
  </tr>
</table>
</table>
</body>
</html>




