<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_khsmjl_jlh=null;
	String crm_khsmjl_khbh=null;
	String crm_zxkhxx_sjs=null;
	String crm_khsmjl_smsj=null;
	String crm_khsmjl_smmd=null;
	String jdr=null;
	String jdrbh=null;
	String crm_khsmjl_jdrbm=null;
	String crm_khsmjl_jdjglrr=null;
	String crm_khsmjl_jdjglrsj=null;
	String crm_khsmjl_qksfss=null;
	String crm_khsmjl_shr=null;
	String crm_khsmjl_shsj=null;
	String crm_khsmjl_zt=null;
	String crm_khsmjl_lrr=null;
	String crm_khsmjl_lrsj=null;
	String crm_khsmjl_ssfgs=null;

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String sfhf=null;
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (crm_khsmjl.sfhf='"+sfhf+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}

	//���ô���20100810
	String lfcs=null;
	lfcs=request.getParameter("lfcs");
	if (lfcs!=null)
	{
		lfcs=cf.GB2Uni(lfcs);
		if (!(lfcs.equals("")))	wheresql+=" and  (crm_khsmjl.lfcs='"+lfcs+"')";
	}
	
	
	crm_khsmjl_jlh=request.getParameter("crm_khsmjl_jlh");
	if (crm_khsmjl_jlh!=null)
	{
		crm_khsmjl_jlh=cf.GB2Uni(crm_khsmjl_jlh);
		if (!(crm_khsmjl_jlh.equals("")))	wheresql+=" and  (crm_khsmjl.jlh='"+crm_khsmjl_jlh+"')";
	}
	crm_khsmjl_khbh=request.getParameter("crm_khsmjl_khbh");
	if (crm_khsmjl_khbh!=null)
	{
		crm_khsmjl_khbh=cf.GB2Uni(crm_khsmjl_khbh);
		if (!(crm_khsmjl_khbh.equals("")))	wheresql+=" and  (crm_khsmjl.khbh='"+crm_khsmjl_khbh+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	crm_khsmjl_smsj=request.getParameter("crm_khsmjl_smsj");
	if (crm_khsmjl_smsj!=null)
	{
		crm_khsmjl_smsj=crm_khsmjl_smsj.trim();
		if (!(crm_khsmjl_smsj.equals("")))	wheresql+="  and (crm_khsmjl.smsj>=TO_DATE('"+crm_khsmjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_smsj=request.getParameter("crm_khsmjl_smsj2");
	if (crm_khsmjl_smsj!=null)
	{
		crm_khsmjl_smsj=crm_khsmjl_smsj.trim();
		if (!(crm_khsmjl_smsj.equals("")))	wheresql+="  and (crm_khsmjl.smsj<=TO_DATE('"+crm_khsmjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_smmd=request.getParameter("crm_khsmjl_smmd");
	if (crm_khsmjl_smmd!=null)
	{
		crm_khsmjl_smmd=cf.GB2Uni(crm_khsmjl_smmd);
		if (!(crm_khsmjl_smmd.equals("")))	wheresql+=" and  (crm_khsmjl.smmd='"+crm_khsmjl_smmd+"')";
	}
	jdr=request.getParameter("jdr");
	if (jdr!=null)
	{
		jdr=cf.GB2Uni(jdr);
		if (!(jdr.equals("")))	wheresql+=" and  (crm_khsmjl.jdr like '%"+jdr+"%')";
	}
	jdrbh=request.getParameter("jdrbh");
	if (jdrbh!=null)
	{
		jdrbh=jdrbh.trim();
		if (!(jdrbh.equals("")))	wheresql+=" and (crm_khsmjl.jdrbh="+jdrbh+") ";
	}
	crm_khsmjl_jdrbm=request.getParameter("crm_khsmjl_jdrbm");
	if (crm_khsmjl_jdrbm!=null)
	{
		crm_khsmjl_jdrbm=cf.GB2Uni(crm_khsmjl_jdrbm);
		if (!(crm_khsmjl_jdrbm.equals("")))	wheresql+=" and  (crm_khsmjl.jdrbm='"+crm_khsmjl_jdrbm+"')";
	}
	crm_khsmjl_jdjglrr=request.getParameter("crm_khsmjl_jdjglrr");
	if (crm_khsmjl_jdjglrr!=null)
	{
		crm_khsmjl_jdjglrr=cf.GB2Uni(crm_khsmjl_jdjglrr);
		if (!(crm_khsmjl_jdjglrr.equals("")))	wheresql+=" and  (crm_khsmjl.jdjglrr='"+crm_khsmjl_jdjglrr+"')";
	}
	crm_khsmjl_jdjglrsj=request.getParameter("crm_khsmjl_jdjglrsj");
	if (crm_khsmjl_jdjglrsj!=null)
	{
		crm_khsmjl_jdjglrsj=crm_khsmjl_jdjglrsj.trim();
		if (!(crm_khsmjl_jdjglrsj.equals("")))	wheresql+="  and (crm_khsmjl.jdjglrsj>=TO_DATE('"+crm_khsmjl_jdjglrsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_jdjglrsj=request.getParameter("crm_khsmjl_jdjglrsj2");
	if (crm_khsmjl_jdjglrsj!=null)
	{
		crm_khsmjl_jdjglrsj=crm_khsmjl_jdjglrsj.trim();
		if (!(crm_khsmjl_jdjglrsj.equals("")))	wheresql+="  and (crm_khsmjl.jdjglrsj<=TO_DATE('"+crm_khsmjl_jdjglrsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_qksfss=request.getParameter("crm_khsmjl_qksfss");
	if (crm_khsmjl_qksfss!=null)
	{
		crm_khsmjl_qksfss=cf.GB2Uni(crm_khsmjl_qksfss);
		if (!(crm_khsmjl_qksfss.equals("")))	wheresql+=" and  (crm_khsmjl.qksfss='"+crm_khsmjl_qksfss+"')";
	}
	crm_khsmjl_shr=request.getParameter("crm_khsmjl_shr");
	if (crm_khsmjl_shr!=null)
	{
		crm_khsmjl_shr=cf.GB2Uni(crm_khsmjl_shr);
		if (!(crm_khsmjl_shr.equals("")))	wheresql+=" and  (crm_khsmjl.shr='"+crm_khsmjl_shr+"')";
	}
	crm_khsmjl_shsj=request.getParameter("crm_khsmjl_shsj");
	if (crm_khsmjl_shsj!=null)
	{
		crm_khsmjl_shsj=crm_khsmjl_shsj.trim();
		if (!(crm_khsmjl_shsj.equals("")))	wheresql+="  and (crm_khsmjl.shsj>=TO_DATE('"+crm_khsmjl_shsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_shsj=request.getParameter("crm_khsmjl_shsj2");
	if (crm_khsmjl_shsj!=null)
	{
		crm_khsmjl_shsj=crm_khsmjl_shsj.trim();
		if (!(crm_khsmjl_shsj.equals("")))	wheresql+="  and (crm_khsmjl.shsj<=TO_DATE('"+crm_khsmjl_shsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_zt=request.getParameter("crm_khsmjl_zt");
	if (crm_khsmjl_zt!=null)
	{
		crm_khsmjl_zt=cf.GB2Uni(crm_khsmjl_zt);
		if (!(crm_khsmjl_zt.equals("")))	wheresql+=" and  (crm_khsmjl.zt='"+crm_khsmjl_zt+"')";
	}
	crm_khsmjl_lrr=request.getParameter("crm_khsmjl_lrr");
	if (crm_khsmjl_lrr!=null)
	{
		crm_khsmjl_lrr=cf.GB2Uni(crm_khsmjl_lrr);
		if (!(crm_khsmjl_lrr.equals("")))	wheresql+=" and  (crm_khsmjl.lrr='"+crm_khsmjl_lrr+"')";
	}
	crm_khsmjl_lrsj=request.getParameter("crm_khsmjl_lrsj");
	if (crm_khsmjl_lrsj!=null)
	{
		crm_khsmjl_lrsj=crm_khsmjl_lrsj.trim();
		if (!(crm_khsmjl_lrsj.equals("")))	wheresql+="  and (crm_khsmjl.lrsj>=TO_DATE('"+crm_khsmjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_lrsj=request.getParameter("crm_khsmjl_lrsj2");
	if (crm_khsmjl_lrsj!=null)
	{
		crm_khsmjl_lrsj=crm_khsmjl_lrsj.trim();
		if (!(crm_khsmjl_lrsj.equals("")))	wheresql+="  and (crm_khsmjl.lrsj<=TO_DATE('"+crm_khsmjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	crm_khsmjl_ssfgs=request.getParameter("crm_khsmjl_ssfgs");
	if (crm_khsmjl_ssfgs!=null)
	{
		crm_khsmjl_ssfgs=cf.GB2Uni(crm_khsmjl_ssfgs);
		if (!(crm_khsmjl_ssfgs.equals("")))	wheresql+=" and  (crm_khsmjl.ssfgs='"+crm_khsmjl_ssfgs+"')";
	}
	ls_sql="SELECT crm_khsmjl.jlh,DECODE(crm_khsmjl.sfhf,'Y','�ط�','N','δ�ط�'),crm_khsmjl.khbh,crm_zxkhxx.khxm,crm_khsmjl.lfcs,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,TO_CHAR(crm_khsmjl.smsj,'YYYY-MM-DD'),crm_khsmjl.smmd,crm_khsmjl.jdr,a.dwmc jdrbm,crm_khsmjl.sjjdqk,crm_khsmjl.lrr,crm_khsmjl.lrsj,b.dwmc ssfgs,crm_khsmjl.bz  ";
	ls_sql+=" FROM crm_zxkhxx,crm_khsmjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_khsmjl.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_khsmjl.jdrbm=a.dwbh(+) and crm_khsmjl.ssfgs=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khsmjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khsmjl.jdrbm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khsmjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhxxSmList.jsp","","gethflx.jsp?lx=1","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("�ط�");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/smjl/ViewCrm_khsmjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ſͻ��ط�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">��¼��</td>
	<td  width="3%">�Ƿ�ط�</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="2%">���Ŵ���</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">����Ŀ��</td>
	<td  width="3%">�Ӵ���</td>
	<td  width="6%">�Ӵ��˲���</td>
	<td  width="24%">ʵ�ʽӴ����</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="14%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>