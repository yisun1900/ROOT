<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	
	String qdr=null;
	qdr=request.getParameter("qdr");
	if (qdr!=null)
	{
		qdr=cf.GB2Uni(qdr);
		if (!(qdr.equals("")))	wheresql+=" and  (crm_zxkhxx.qdr='"+qdr+"')";
	}

	String ywybm=null;
	ywybm=request.getParameter("ywybm");
	if (ywybm!=null)
	{
		ywybm=cf.GB2Uni(ywybm);
		if (!(ywybm.equals("")))	wheresql+=" and  (crm_zxkhxx.ywybm='"+ywybm+"')";
	}
	String ywyssxz=null;
	ywyssxz=request.getParameter("ywyssxz");
	if (ywyssxz!=null)
	{
		ywyssxz=cf.GB2Uni(ywyssxz);
		if (!(ywyssxz.equals("")))	wheresql+=" and  (crm_zxkhxx.ywyssxz='"+ywyssxz+"')";
	}
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String ywy1=null;
	ywy1=request.getParameter("ywy1");
	if (ywy1!=null)
	{
		ywy1=cf.GB2Uni(ywy1);
		if (!(ywy1.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy1+"')";
	}

	
	
	String xqlx=null;
	xqlx=request.getParameter("xqlx");
	if (xqlx!=null)
	{
		xqlx=cf.GB2Uni(xqlx);
		if (!(xqlx.equals("")))	wheresql+=" and  (crm_zxkhxx.xqlx='"+xqlx+"')";
	}
	String khzyxz=null;
	khzyxz=request.getParameter("khzyxz");
	if (khzyxz!=null)
	{
		khzyxz=cf.GB2Uni(khzyxz);
		if (!(khzyxz.equals("")))	wheresql+=" and  (crm_zxkhxx.khzyxz='"+khzyxz+"')";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
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

	String khbh=null;
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}


	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}


	String sfxhf=null;
	String hfrq=null;

	sfxhf=request.getParameter("sfxhf");
	if (sfxhf!=null)
	{
		sfxhf=cf.GB2Uni(sfxhf);
		if (!(sfxhf.equals("")))	wheresql+=" and  (crm_zxkhxx.sfxhf='"+sfxhf+"')";
	}
	hfrq=request.getParameter("hfrq");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq>=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	hfrq=request.getParameter("hfrq2");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq<=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}

	String yqwjdjsj=request.getParameter("yqwjdjsj");
	wheresql+="  and (SYSDATE-crm_zxkhxx.lrsj>"+yqwjdjsj+")";

	String myxssl=request.getParameter("myxssl");
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.qdr,crm_zxkhxx.dianz,sjs,sq_dwxx.dwmc,crm_zxkhxx.lrr,crm_zxkhxx.lrsj,NVL(DECODE(crm_zxkhxx.gdczlx,'3','�ͻ�¼��','6','��Ӫҵ����','8','�����ʦ','E','��ǩ����'),'¼��ͻ�'),crm_zxkhxx.gdczr,crm_zxkhxx.gdczsj,crm_zxkhxx.xqlx,crm_zxkhxx.khzyxz,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') as zxzt,fwlxmc ";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx ";
    ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) ";
    ls_sql+=" and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)=0 ";
    ls_sql+=" and (crm_zxkhxx.gdczlx is null OR crm_zxkhxx.gdczlx='3')";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=" and zxzt in('0','1','5')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.lrsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhxxWjdjList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"��ǩ����"};//��ť����ʾ����
	String[] buttonLink={"plhqdr.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">����δ������ͻ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="5%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="4%">ǩ����</td>
	<td  width="5%">Ӫҵ����</td>
	<td  width="4%">���ʦ</td>
	<td  width="8%">��ѯ����</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="6%">��������</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="6%">С������</td>
	<td  width="6%">�ͻ���Դ����</td>
	<td  width="7%">��ѯ״̬</td>
	<td  width="48%">��������</td>
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