<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
	String dqbm=null;
	
	String yddbh=null;
	String khxm=null;
	String jhazsj=null;
	String lrsj=null;
    double zqzjxze=0;
    double zjxze=0;
    double mmzkl=0;
	String dwmc=null;
	String sjs=null;
	String hth=null;
	String cxhdbm=null;
	String pdgc=null;
	String zjxfssj=null;
	String zjxbz=null;
	Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
	try {
	    conn=cf.getConnection();
	    ls_sql="select jc_mmzjx.yddbh,jc_mmzjx.bz,sq_dwxx.dqbm,crm_khxx.khxm,jc_mmzjx.jhazsj,jc_mmzjx.lrsj,jc_mmzjx.zqzjxze,jc_mmzjx.zjxze,jc_mmzjx.mmzkl,dwmc,crm_khxx.sjs,crm_khxx.hth,crm_khxx.cxhdbm,jc_mmzjx.pdgc,jc_mmzjx.zjxfssj";
	    ls_sql+=" from  jc_mmydd,crm_khxx,jc_mmzjx,sq_dwxx";
		ls_sql+=" where jc_mmydd.yddbh=jc_mmzjx.yddbh and jc_mmydd.khbh=crm_khxx.khbh and jc_mmzjx.zjxxh="+zjxxh;
		ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
//		out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
			yddbh=cf.fillNull(rs.getString("yddbh"));
			zjxbz=cf.fillNull(rs.getString("bz"));
			dqbm=cf.fillNull(rs.getString("dqbm"));
			khxm=cf.fillNull(rs.getString("khxm"));
			jhazsj=cf.fillNull(rs.getDate("jhazsj"));
			lrsj=cf.fillNull(rs.getDate("lrsj"));
			zqzjxze=rs.getDouble("zqzjxze");
			zjxze=rs.getDouble("zjxze");
			mmzkl=rs.getDouble("mmzkl");
			dwmc=cf.fillNull(rs.getString("dwmc"));
			sjs=cf.fillNull(rs.getString("sjs"));
			hth=cf.fillNull(rs.getString("hth"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			pdgc=cf.fillNull(rs.getString("pdgc"));
			zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		 }
	     rs.close();
	     ps.close();

//		zqzjxze=cf.round(zqzjxze,0);

%>

<html>
<head>
<title>�����ڴ�ľ��ȷ�ϱ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 20px'>
  <tr> 
    <td width="33%"> ������ţ�<%=yddbh%> </td>
    <td width="67%"><strong>Ԫ �� ľ �� �� ͬ �� ���������</strong></td>
  </tr>
</table>

<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="405" scope="row">�ͻ�������<%=khxm%></td>
    <td width="285" scope="row"> 
      <div align="left"> ���湤��(<%=pdgc%>)��¼��</div>
    </td>
    <td width="299">��װ���ڣ�<%=jhazsj%></td>
  </tr>
  <tr> 
    <td width="405" scope="row">ǩԼ����/��װ���ʦ��<%=dwmc%>/<%=sjs%></td>
    <td width="285" scope="row"> 
      <div align="left">��װ��ͬ�ţ�<%=hth%> </div>
    </td>
    <td width="299">�μӴ������<%=cxhdbm%></td>
  </tr>
</table>

		  
  <b style='FONT-SIZE: 14px'>ľ��Ʒ����</b> 
  <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="3%">&nbsp;</td>
	  <td  width="6%">��ʽ</td>
	  <td  width="8%">��������</td>
	  <td  width="6%">��װλ��</td>
	  <td  width="4%">��˫��</td>
	  <td  width="6%">��ɫ</td>
	  <td  width="9%">�ز�����</td>
	  <td  width="11%">�Ŷ�(����ߡ���)��mm��</td>
	  <td  width="4%">���ȿ�mm</td>
	  <td  width="4%">��λ</td>
	  <td  width="4%">��������</td>
	  <td  width="7%">���(Ԫ)</td>
	  <td  width="5%">���׼��ɲ�</td>
	  <td  width="8%">��������</td>
	  <td  width="15%">��ע</td>
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
	double zqzj=0;
	double allzj=0;
	double allzqzj=0;
	String sfsmjcc=null;
	String blxh=null;
	String ysbm=null;
	String mmczmc=null;
	String sfydc=null;
	String ctbs=null;
	String tjx=null;
	String zp=null;
	String bz=null;
	String zjsl=null;
	String mtxmc=null;
	String mxxmc=null;

	int row=0;
	ls_sql="SELECT jc_mmdgdmx.mmdglxbm,mmdglxmc,jc_mmdgdmx.ysbm,mmczmc,jc_mmdgdmx.mmxh,azwzmc,kqfxmc,mtxmc,mxxmc,DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��') dsk,czmc";
	ls_sql+=" ,dczlmc||'('||jc_mmdgdmx.dbh||')' dczlmc,jc_mmdgdmx.mdk,jc_mmdgdmx.mdg,jc_mmdgdmx.qh";
	ls_sql+=" ,TO_CHAR(jc_mmdgdmx.mdk-95) ms,(jc_mmzjxmx.xsl-jc_mmzjxmx.ysl)*jc_mmdgdmx.bzdj zqzj,(jc_mmzjxmx.xsl-jc_mmzjxmx.ysl)*jc_mmdgdmx.dj zj,blxh,jc_mmdgdmx.bz,jc_mmzjxmx.xsl-jc_mmzjxmx.ysl zjsl ";
	ls_sql+=" ,DECODE(jc_mmdgdmx.sfsmjcc,'Y','���ɲ�','N','��') sfsmjcc,jc_mmxhb.zp,jc_mmdgdmx.sfydc,jc_mmdgdmx.ctbs,jc_mmdgdmx.tjx";
	ls_sql+=" FROM dm_czbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm,jdm_mmczbm,jc_mmzjxmx,jdm_mtxbm,jdm_mxxbm";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.xh=jc_mmzjxmx.xh and jc_mmzjxmx.yddbh='"+yddbh+"' and jc_mmzjxmx.zjxxh="+zjxxh;
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
		zjsl=cf.fillHtml(rs.getString("zjsl"));

		allzj+=zj;
		allzqzj+=zqzj;



		if (sfydc.equals("Y"))//Y���ж�����N���޶���
		{
			bz="�ж�����"+bz;
		}
		if (ctbs.equals("3"))//3�����ߣ�4���ı�
		{
			bz="����/�������ߣ�"+bz;
		}
		else if (ctbs.equals("4"))//3�����ߣ�4���ı�
		{
			bz="����/�����ıߣ�"+bz;
		}
		if (ysbm.equals("14") || ysbm.equals("15"))//14:�׻����ף���������;15:�������ף��׻�����
		{
			bz=mmczmc+"��"+bz;
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
			md=mdk+"��"+mdg+"��"+qh;
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td><%=mmxh%></td>
			  <td><%=kqfxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><%=czmc%></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td>��</td>
			  <td><%=zjsl%></td>
			  <td><%=zqzj%></td>
			  <td><%=sfsmjcc%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=bz%></td>
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
			  <td><%=czmc%></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td>����</td>
			  <td><%=zjsl%></td>
			  <td><%=zqzj%></td>
			  <td><%=sfsmjcc%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=bz%></td>
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
			  <td><%=czmc%></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td>&nbsp;</td>
			  <td><%=zjsl%></td>
			  <td><%=zqzj%></td>
			  <td><%=sfsmjcc%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=bz%></td>
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
			  <td><%=czmc%></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td>&nbsp;</td>
			  <td><%=zjsl%></td>
			  <td><%=zqzj%></td>
			  <td><%=sfsmjcc%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=bz%></td>
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
			  <td><%=czmc%></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td>&nbsp;</td>
			  <td><%=zjsl%></td>
			  <td><%=zqzj%></td>
			  <td><%=sfsmjcc%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=bz%></td>
			</tr>
			<%
		}
		else{
			md=mdk+"��"+mdg+"��"+qh;
			ms="&nbsp;";
			%>
			<tr align="center"> 
			  <td><%=row%></td>
			  <td colspan="2"><%=mmdglxmc%></td>
			  <td><%=azwzmc%></td>
			  <td><%=dsk%></td>
			  <td><%=czmc%></td>
			  <td><%=dczlmc%></td>
			  <td><%=md%></td>
			  <td><%=ms%></td>
			  <td>&nbsp;</td>
			  <td><%=zjsl%></td>
			  <td><%=zqzj%></td>
			  <td><%=sfsmjcc%></td>
			  <td><%=blxh%></td>
			  <td align="left"><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();
%> 
		<tr align="center"> 
		  <td colspan="6">�ϼƣ�<%=cf.formatDouble(allzqzj)%>Ԫ</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
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

<b style='FONT-SIZE: 14px'>����ಿ��</b> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="4%">���</td>
	  <td  width="20%">����</td>
	  <td  width="12%">Ʒ��</td>
	  <td  width="12%">�ͺ�</td>
	  <td  width="8%">��λ</td>
	  <td  width="8%">����</td>
	  <td  width="8%">��������</td>
	  <td  width="10%">�������</td>
	  <td  width="20%">��ע</td>
	</tr>
<%

	ls_sql="SELECT rownum,wjmc,wjjmc,jc_wjjddmx.xinghao,jldw,TO_CHAR(jc_wjjddmx.bzdj),jc_wjzjxmx.xsl-jc_wjzjxmx.ysl,(jc_wjzjxmx.xsl-jc_wjzjxmx.ysl)*jc_wjjddmx.bzdj,jc_wjjddmx.bz";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jc_wjzjxmx ";
    ls_sql+=" where  jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
    ls_sql+=" and jc_wjjddmx.lrxh=jc_wjzjxmx.lrxh and jc_wjzjxmx.yddbh='"+yddbh+"' and jc_wjzjxmx.zjxxh="+zjxxh;
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
	  <td  width="10%">�������</td>
	  <td  width="32%">��ע</td>
	</tr>
<%

	ls_sql="SELECT rownum,blxh,blyt,TO_CHAR(jc_blddmx.bzdj) as jc_blddmx_dj,jc_blzjxmx.xsl-jc_blzjxmx.ysl,jc_blddmx.bzdj*(jc_blzjxmx.xsl-jc_blzjxmx.ysl) je,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jdm_blytbm,jc_blzjxmx  ";
    ls_sql+=" where jc_blddmx.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blddmx.lrxh=jc_blzjxmx.lrxh and jc_blzjxmx.yddbh='"+yddbh+"' and jc_blzjxmx.zjxxh="+zjxxh;
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
    <td height="42">��ע��<%=zjxbz%></td>
  </tr>
  <tr> 
    <td height="3">������ʾ�������������Ǹ���ľ�ذ壬1.5m��Χ�ڵ�������2--3mm������Ե��������ƽ����</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
<%
if (mmzkl!=10)
{
	%>
	  <tr> 
		<td width="36%" height="2">�ۼƽ��(��ǰ)��<%=cf.formatDouble(zqzjxze)%>Ԫ��Сд��</td>
		<td width="35%" height="2">�ۼƽ��(�ۺ�)��<%=cf.formatDouble(zjxze)%>Ԫ��Сд��</td>
		<td width="29%" height="2">ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</td>
	  </tr>
	  <tr> 
		<td>����д����<%=cf.NumToRMBStr(zqzjxze)%></td>
		<td>����д����<%=cf.NumToRMBStr(zjxze)%></td>
		<td>&nbsp;</td>
	  </tr>
	<%
}
else{
	%>
	  <tr> 
		
    <td width="36%" height="2">�ۼƽ�<%=cf.formatDouble(zjxze)%>Ԫ��Сд��</td>
    <td width="35%" height="2">ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</td>
    <td width="29%" height="2">&nbsp;</td>
	  </tr>
	  <tr> 
		
    <td>����д����<%=cf.NumToRMBStr(zjxze)%></td>
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
          <td >ǩ�����ڣ�<%=zjxfssj%></td>
          <td >ǩ�����ڣ�<%=zjxfssj%></td>
        </tr>
      </table>    </td>
  </tr>
</table>



</body>
</html>



