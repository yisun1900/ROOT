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

	
	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
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

	
	String zrbmclzt=null;
	String crm_tsjl_tsjlh=null;
	String lx=null;

	String crm_tsjl_lrr=null;
	String crm_tsjl_lrsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_slsj=null;

	String crm_tsjl_yqjjsj=null;
	String crm_tsjl_jasj=null;



	zrbmclzt=request.getParameter("zrbmclzt");
	if (zrbmclzt!=null)
	{
		if (!(zrbmclzt.equals("")))	wheresql+=" and  (crm_tsjl.zrbmclzt='"+zrbmclzt+"')";
	}

	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=crm_tsjl_tsjlh.trim();
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and (crm_tsjl.tsjlh="+crm_tsjl_tsjlh+") ";
	}

	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (crm_tsjl.lx='"+lx+"')";
	}



	crm_tsjl_slr=request.getParameter("crm_tsjl_slr");
	if (crm_tsjl_slr!=null)
	{
		crm_tsjl_slr=cf.GB2Uni(crm_tsjl_slr);
		if (!(crm_tsjl_slr.equals("")))	wheresql+=" and  (crm_tsjl.slr='"+crm_tsjl_slr+"')";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj2");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}


	crm_tsjl_lrr=request.getParameter("crm_tsjl_lrr");
	if (crm_tsjl_lrr!=null)
	{
		crm_tsjl_lrr=cf.GB2Uni(crm_tsjl_lrr);
		if (!(crm_tsjl_lrr.equals("")))	wheresql+=" and  (crm_tsjl.lrr='"+crm_tsjl_lrr+"')";
	}
	crm_tsjl_lrsj=request.getParameter("crm_tsjl_lrsj");
	if (crm_tsjl_lrsj!=null)
	{
		crm_tsjl_lrsj=crm_tsjl_lrsj.trim();
		if (!(crm_tsjl_lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+crm_tsjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_lrsj=request.getParameter("crm_tsjl_lrsj2");
	if (crm_tsjl_lrsj!=null)
	{
		crm_tsjl_lrsj=crm_tsjl_lrsj.trim();
		if (!(crm_tsjl_lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+crm_tsjl_lrsj+"','YYYY/MM/DD'))";
	}


	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj>=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj2");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj<=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}

	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj");
	if (crm_tsjl_jasj!=null)
	{
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj>=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj2");
	if (crm_tsjl_jasj!=null)
	{
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj<=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}

	
	ls_sql="SELECT crm_tsjl.tsjlh,DECODE(crm_tsjl.lx,'1','Ͷ��','2','����') lx,DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������') as clzt,crm_tsjl.jasj,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ѽ��յȴ�������','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as zrbmclzt,khxm,fwdz,tsnr,slfsmc,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.slr,crm_tsjl.slsj,crm_tsjl.khbh";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_dwxx  ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_tsjl.slbm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsjl.clzt='3'";//0��δ����1��������2���ڴ���3���᰸��9:������
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.jasj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tsjlXgJaList.jsp","","EditEnterJa.jsp","DeleteJa.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setViewStr("�޸�");
	pageObj.setEditStr("ɾ��");

	pageObj.alignStr[6]="align='left'";
	pageObj.alignStr[7]="align='left'";


//��������
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("crm_tsjl_khxm",coluParm);//�в����������Hash��
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸Ľ᰸��Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">��¼��</td>
	<td  width="3%">����</td>
	<td  width="5%">�᰸״̬</td>
	<td  width="5%">�᰸ʱ��</td>
	<td  width="6%">���β��Ŵ���״̬</td>
	<td  width="4%">����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="29%">Ͷ�߱�������</td>
	<td  width="4%">Ͷ����Դ</td>
	<td  width="4%">�ͷ�������</td>
	<td  width="5%">�ͷ�����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="4%">�ͻ����</td>
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