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
	String crm_khpfd_pfjlh=null;
	String crm_khpfd_tsjlh=null;
	String crm_khpfd_dwbh=null;
	String crm_khpfd_pfjecdf=null;
	String crm_khpfd_shr=null;
	String crm_khpfd_shsj=null;
	String crm_khpfd_cwjsr=null;
	String crm_khpfd_cwjssj=null;
	String crm_khpfd_zffs=null;
	String crm_khpfd_zfr=null;
	String crm_khpfd_zfsj=null;
	String crm_khpfd_pfzt=null;
	String crm_khpfd_lrsj=null;
	String crm_khpfd_lrr=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}


	crm_khpfd_pfjlh=request.getParameter("crm_khpfd_pfjlh");
	if (crm_khpfd_pfjlh!=null)
	{
		crm_khpfd_pfjlh=cf.GB2Uni(crm_khpfd_pfjlh);
		if (!(crm_khpfd_pfjlh.equals("")))	wheresql+=" and  (crm_khpfd.pfjlh='"+crm_khpfd_pfjlh+"')";
	}
	crm_khpfd_tsjlh=request.getParameter("crm_khpfd_tsjlh");
	if (crm_khpfd_tsjlh!=null)
	{
		crm_khpfd_tsjlh=cf.GB2Uni(crm_khpfd_tsjlh);
		if (!(crm_khpfd_tsjlh.equals("")))	wheresql+=" and  (crm_khpfd.tsjlh='"+crm_khpfd_tsjlh+"')";
	}
	crm_khpfd_dwbh=request.getParameter("crm_khpfd_dwbh");
	if (crm_khpfd_dwbh!=null)
	{
		crm_khpfd_dwbh=cf.GB2Uni(crm_khpfd_dwbh);
		if (!(crm_khpfd_dwbh.equals("")))	wheresql+=" and  (crm_khpfd.dwbh='"+crm_khpfd_dwbh+"')";
	}
	crm_khpfd_pfjecdf=request.getParameter("crm_khpfd_pfjecdf");
	if (crm_khpfd_pfjecdf!=null)
	{
		crm_khpfd_pfjecdf=cf.GB2Uni(crm_khpfd_pfjecdf);
		if (!(crm_khpfd_pfjecdf.equals("")))	wheresql+=" and  (crm_khpfd.pfjecdf='"+crm_khpfd_pfjecdf+"')";
	}
	crm_khpfd_shr=request.getParameter("crm_khpfd_shr");
	if (crm_khpfd_shr!=null)
	{
		crm_khpfd_shr=cf.GB2Uni(crm_khpfd_shr);
		if (!(crm_khpfd_shr.equals("")))	wheresql+=" and  (crm_khpfd.shr='"+crm_khpfd_shr+"')";
	}
	crm_khpfd_shsj=request.getParameter("crm_khpfd_shsj");
	if (crm_khpfd_shsj!=null)
	{
		crm_khpfd_shsj=crm_khpfd_shsj.trim();
		if (!(crm_khpfd_shsj.equals("")))	wheresql+="  and (crm_khpfd.shsj>=TO_DATE('"+crm_khpfd_shsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_shsj=request.getParameter("crm_khpfd_shsj2");
	if (crm_khpfd_shsj!=null)
	{
		crm_khpfd_shsj=crm_khpfd_shsj.trim();
		if (!(crm_khpfd_shsj.equals("")))	wheresql+="  and (crm_khpfd.shsj<=TO_DATE('"+crm_khpfd_shsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_cwjsr=request.getParameter("crm_khpfd_cwjsr");
	if (crm_khpfd_cwjsr!=null)
	{
		crm_khpfd_cwjsr=cf.GB2Uni(crm_khpfd_cwjsr);
		if (!(crm_khpfd_cwjsr.equals("")))	wheresql+=" and  (crm_khpfd.cwjsr='"+crm_khpfd_cwjsr+"')";
	}
	crm_khpfd_cwjssj=request.getParameter("crm_khpfd_cwjssj");
	if (crm_khpfd_cwjssj!=null)
	{
		crm_khpfd_cwjssj=crm_khpfd_cwjssj.trim();
		if (!(crm_khpfd_cwjssj.equals("")))	wheresql+="  and (crm_khpfd.cwjssj>=TO_DATE('"+crm_khpfd_cwjssj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_cwjssj=request.getParameter("crm_khpfd_cwjssj2");
	if (crm_khpfd_cwjssj!=null)
	{
		crm_khpfd_cwjssj=crm_khpfd_cwjssj.trim();
		if (!(crm_khpfd_cwjssj.equals("")))	wheresql+="  and (crm_khpfd.cwjssj<=TO_DATE('"+crm_khpfd_cwjssj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_zffs=request.getParameter("crm_khpfd_zffs");
	if (crm_khpfd_zffs!=null)
	{
		crm_khpfd_zffs=cf.GB2Uni(crm_khpfd_zffs);
		if (!(crm_khpfd_zffs.equals("")))	wheresql+=" and  (crm_khpfd.zffs='"+crm_khpfd_zffs+"')";
	}
	crm_khpfd_zfr=request.getParameter("crm_khpfd_zfr");
	if (crm_khpfd_zfr!=null)
	{
		crm_khpfd_zfr=cf.GB2Uni(crm_khpfd_zfr);
		if (!(crm_khpfd_zfr.equals("")))	wheresql+=" and  (crm_khpfd.zfr='"+crm_khpfd_zfr+"')";
	}
	crm_khpfd_zfsj=request.getParameter("crm_khpfd_zfsj");
	if (crm_khpfd_zfsj!=null)
	{
		crm_khpfd_zfsj=crm_khpfd_zfsj.trim();
		if (!(crm_khpfd_zfsj.equals("")))	wheresql+="  and (crm_khpfd.zfsj>=TO_DATE('"+crm_khpfd_zfsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_zfsj=request.getParameter("crm_khpfd_zfsj2");
	if (crm_khpfd_zfsj!=null)
	{
		crm_khpfd_zfsj=crm_khpfd_zfsj.trim();
		if (!(crm_khpfd_zfsj.equals("")))	wheresql+="  and (crm_khpfd.zfsj<=TO_DATE('"+crm_khpfd_zfsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_pfzt=request.getParameter("crm_khpfd_pfzt");
	if (crm_khpfd_pfzt!=null)
	{
		crm_khpfd_pfzt=cf.GB2Uni(crm_khpfd_pfzt);
		if (!(crm_khpfd_pfzt.equals("")))	wheresql+=" and  (crm_khpfd.pfzt='"+crm_khpfd_pfzt+"')";
	}
	crm_khpfd_lrsj=request.getParameter("crm_khpfd_lrsj");
	if (crm_khpfd_lrsj!=null)
	{
		crm_khpfd_lrsj=crm_khpfd_lrsj.trim();
		if (!(crm_khpfd_lrsj.equals("")))	wheresql+="  and (crm_khpfd.lrsj>=TO_DATE('"+crm_khpfd_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_lrsj=request.getParameter("crm_khpfd_lrsj2");
	if (crm_khpfd_lrsj!=null)
	{
		crm_khpfd_lrsj=crm_khpfd_lrsj.trim();
		if (!(crm_khpfd_lrsj.equals("")))	wheresql+="  and (crm_khpfd.lrsj<=TO_DATE('"+crm_khpfd_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_lrr=request.getParameter("crm_khpfd_lrr");
	if (crm_khpfd_lrr!=null)
	{
		crm_khpfd_lrr=cf.GB2Uni(crm_khpfd_lrr);
		if (!(crm_khpfd_lrr.equals("")))	wheresql+=" and  (crm_khpfd.lrr='"+crm_khpfd_lrr+"')";
	}
	ls_sql="SELECT crm_khpfd.pfjlh,DECODE(crm_khpfd.pfzt,'1','�ȴ����','2','�����','3','�������','4','�⸶���'),crm_khpfd.tsjlh,crm_khpfd.khbh,crm_khxx.khxm,crm_khxx.fwdz,a.dwmc dwbh,crm_khpfd.pfjecdf,crm_khpfd.pfje,crm_khpfd.pfyy,crm_khpfd.shr,crm_khpfd.shsj,crm_khpfd.shyj,crm_khpfd.cwjsr,crm_khpfd.cwjssj, DECODE(crm_khpfd.zffs,'0','δ֧��','1','�ֽ�','2','ת��'),crm_khpfd.zfr,crm_khpfd.zfsj, crm_khpfd.lrr,crm_khpfd.lrsj,b.dwmc lrbm,crm_khpfd.bz  ";
	ls_sql+=" FROM crm_khpfd,crm_khxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_khpfd.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khpfd.dwbh=a.dwbh(+) and crm_khpfd.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_khpfd.pfzt='3'";//1���ȴ���ˣ�2������ˣ�3��������գ�4���⸶���
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khpfd.shsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khpfdXgJsList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"pfjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ������"};//��ť����ʾ����
	String[] buttonLink={"Crm_khpfdXgJsList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String yhmc=(String)session.getAttribute("yhmc");

	String[] pfjlh = request.getParameterValues("pfjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pfjlh,"pfjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update crm_khpfd set cwjsr=null,cwjssj=null,pfzt='2' where pfzt='3' and "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�⸶����������գ�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">�⸶��¼��</td>
	<td  width="3%">�⸶��״̬</td>
	<td  width="3%">Ͷ�߱��޼�¼��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="3%">������β���</td>
	<td  width="2%">�⸶�е���</td>
	<td  width="3%">�⸶���</td>
	<td  width="14%">�⸶ԭ��</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="13%">������</td>
	<td  width="2%">���������</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="3%">�⸶֧����ʽ</td>
	<td  width="3%">�⸶֧����</td>
	<td  width="3%">�⸶֧��ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼���˲���</td>
	<td  width="33%">��ע</td>
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