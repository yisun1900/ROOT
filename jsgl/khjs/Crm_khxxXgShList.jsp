<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_zjxdj_zjxxh=null;
	String hth=null;
	String crm_zjxdj_dwbh=null;
	String crm_zjxdj_khbh=null;
	String crm_zjxdj_khxm=null;
	String crm_zjxdj_dh=null;
	String crm_zjxdj_sgd=null;
	String crm_zjxdj_sgbz=null;
	String crm_zjxdj_zjxyybm=null;
	String crm_zjxdj_zjxyysm=null;
	String crm_zjxdj_zjje=null;
	String crm_zjxdj_lrr=null;
	String crm_zjxdj_lrsj=null;
	String fssj=null;
	String crm_zjxdj_fwdz=null;
	String zjxfsjd=null;

	String gckkspbz=null;
	gckkspbz=request.getParameter("gckkspbz");
	if (gckkspbz!=null)
	{
		gckkspbz=gckkspbz.trim();
		if (!(gckkspbz.equals("")))	wheresql+=" and (crm_khxx.gckkspbz='"+gckkspbz+"') ";
	}

	String zjxwcbz=null;
	zjxwcbz=request.getParameter("zjxwcbz");
	if (zjxwcbz!=null)
	{
		zjxwcbz=zjxwcbz.trim();
		if (!(zjxwcbz.equals("")))	wheresql+=" and (crm_zjxdj.zjxwcbz="+zjxwcbz+") ";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	
	String crm_zjxdj_lrdw=null;
	crm_zjxdj_lrdw=request.getParameter("crm_zjxdj_lrdw");
	if (crm_zjxdj_lrdw!=null)
	{
		if (!(crm_zjxdj_lrdw.equals("")))	wheresql+=" and  (crm_zjxdj.lrdw='"+crm_zjxdj_lrdw+"')";
	}


	crm_zjxdj_zjxxh=request.getParameter("crm_zjxdj_zjxxh");
	if (crm_zjxdj_zjxxh!=null)
	{
		crm_zjxdj_zjxxh=crm_zjxdj_zjxxh.trim();
		if (!(crm_zjxdj_zjxxh.equals("")))	wheresql+=" and (crm_zjxdj.zjxxh="+crm_zjxdj_zjxxh+") ";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	crm_zjxdj_dwbh=request.getParameter("crm_zjxdj_dwbh");
	if (!(crm_zjxdj_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_zjxdj_dwbh+"')";

	crm_zjxdj_khbh=request.getParameter("crm_zjxdj_khbh");
	if (crm_zjxdj_khbh!=null)
	{
		crm_zjxdj_khbh=cf.GB2Uni(crm_zjxdj_khbh);
		if (!(crm_zjxdj_khbh.equals("")))	wheresql+=" and  (crm_zjxdj.khbh='"+crm_zjxdj_khbh+"')";
	}
	crm_zjxdj_khxm=request.getParameter("crm_zjxdj_khxm");
	if (crm_zjxdj_khxm!=null)
	{
		crm_zjxdj_khxm=cf.GB2Uni(crm_zjxdj_khxm);
		if (!(crm_zjxdj_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_zjxdj_khxm+"%')";
	}
	crm_zjxdj_dh=request.getParameter("crm_zjxdj_dh");
	if (crm_zjxdj_dh!=null)
	{
		crm_zjxdj_dh=cf.GB2Uni(crm_zjxdj_dh);
		if (!(crm_zjxdj_dh.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_zjxdj_dh+"%')";
	}
	crm_zjxdj_sgd=request.getParameter("crm_zjxdj_sgd");
	if (crm_zjxdj_sgd!=null)
	{
		crm_zjxdj_sgd=cf.GB2Uni(crm_zjxdj_sgd);
		if (!(crm_zjxdj_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_zjxdj_sgd+"')";
	}
	crm_zjxdj_sgbz=request.getParameter("crm_zjxdj_sgbz");
	if (crm_zjxdj_sgbz!=null)
	{
		crm_zjxdj_sgbz=cf.GB2Uni(crm_zjxdj_sgbz);
		if (!(crm_zjxdj_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_zjxdj_sgbz+"')";
	}
	crm_zjxdj_zjxyybm=request.getParameter("crm_zjxdj_zjxyybm");
	if (crm_zjxdj_zjxyybm!=null)
	{
		crm_zjxdj_zjxyybm=cf.GB2Uni(crm_zjxdj_zjxyybm);
		if (!(crm_zjxdj_zjxyybm.equals("")))	wheresql+=" and  (crm_zjxyydj.zjxyybm='"+crm_zjxdj_zjxyybm+"')";
	}
	zjxfsjd=request.getParameter("zjxfsjd");
	if (zjxfsjd!=null)
	{
		if (!(zjxfsjd.equals("")))	wheresql+=" and  (crm_zjxdj.zjxfsjd='"+zjxfsjd+"')";
	}
	crm_zjxdj_zjxyysm=request.getParameter("crm_zjxdj_zjxyysm");
	if (crm_zjxdj_zjxyysm!=null)
	{
		crm_zjxdj_zjxyysm=cf.GB2Uni(crm_zjxdj_zjxyysm);
		if (!(crm_zjxdj_zjxyysm.equals("")))	wheresql+=" and  (crm_zjxdj.zjxyysm like '%"+crm_zjxdj_zjxyysm+"%')";
	}
	crm_zjxdj_zjje=request.getParameter("crm_zjxdj_zjje");
	if (crm_zjxdj_zjje!=null)
	{
		crm_zjxdj_zjje=crm_zjxdj_zjje.trim();
		if (!(crm_zjxdj_zjje.equals("")))	wheresql+=" and  (crm_zjxdj.zjje="+crm_zjxdj_zjje+") ";
	}
	crm_zjxdj_lrr=request.getParameter("crm_zjxdj_lrr");
	if (crm_zjxdj_lrr!=null)
	{
		crm_zjxdj_lrr=cf.GB2Uni(crm_zjxdj_lrr);
		if (!(crm_zjxdj_lrr.equals("")))	wheresql+=" and  (crm_zjxdj.lrr='"+crm_zjxdj_lrr+"')";
	}
	fssj=request.getParameter("fssj");
	if (fssj!=null)
	{
		if (!(fssj.equals("")))	wheresql+="  and (crm_zjxdj.fssj>=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	fssj=request.getParameter("fssj2");
	if (fssj!=null)
	{
		if (!(fssj.equals("")))	wheresql+="  and (crm_zjxdj.fssj<=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	crm_zjxdj_lrsj=request.getParameter("crm_zjxdj_lrsj");
	if (crm_zjxdj_lrsj!=null)
	{
		crm_zjxdj_lrsj=crm_zjxdj_lrsj.trim();
		if (!(crm_zjxdj_lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj>=TO_DATE('"+crm_zjxdj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zjxdj_lrsj=request.getParameter("crm_zjxdj_lrsj2");
	if (crm_zjxdj_lrsj!=null)
	{
		crm_zjxdj_lrsj=crm_zjxdj_lrsj.trim();
		if (!(crm_zjxdj_lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj<=TO_DATE('"+crm_zjxdj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zjxdj_fwdz=request.getParameter("crm_zjxdj_fwdz");
	if (crm_zjxdj_fwdz!=null)
	{
		crm_zjxdj_fwdz=cf.GB2Uni(crm_zjxdj_fwdz);
		if (!(crm_zjxdj_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_zjxdj_fwdz+"%')";
	}
	ls_sql="SELECT crm_zjxdj.zjxxh,'�޸�' sh, hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,sjs ,DECODE(crm_zjxdj.zjxwcbz,'1','δ���','2','�����') zjxwcbz,crm_zjxdj.gckk,DECODE(crm_khxx.gckkspbz,'N','δ����','Y','������') gckkspbz,zjxfsjdmc,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.kglf,crm_zjxdj.kqtk,fssj,crm_zjxdj.lrr,dm_zjxyybm.zjxyymc ";
	ls_sql+=" FROM crm_zjxdj,crm_zjxyydj,dm_zjxyybm,crm_khxx,sq_sgd,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxyydj.zjxyybm=dm_zjxyybm.zjxyybm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_zjxdj.zjxxh=crm_zjxyydj.zjxxh(+) and crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_zjxdj.lrsj,crm_zjxdj.zjxxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxXgShList.jsp","SelectXgShCrm_khxx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zjxxh","crm_zjxdj_fylxbm","crm_zjxdj_khbh","crm_zjxdj_khxm","crm_zjxdj_dh","crm_zjxdj_sgd","dm_zjxyybm_zjxyymc","crm_zjxdj_zjje","crm_zjxdj_fwdz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zjxxh","1");//�в����������Hash��
	spanColHash.put("sh","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sgdmc","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("zjxwcbz","1");//�в����������Hash��
	spanColHash.put("gckk","1");//�в����������Hash��
	spanColHash.put("gckkspbz","1");//�в����������Hash��
	spanColHash.put("zjxfsjdmc","1");//�в����������Hash��
	spanColHash.put("zjje","1");//�в����������Hash��
	spanColHash.put("jzjje","1");//�в����������Hash��
	spanColHash.put("kglf","1");//�в����������Hash��
	spanColHash.put("kqtk","1");//�в����������Hash��
	spanColHash.put("fssj","1");//�в����������Hash��
	spanColHash.put("lrr","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="XgShCrm_zjxdj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sh",coluParm);//�в����������Hash��
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
  <B><font size="3">���̿ۿ�--�޸����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(185);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���������</td>
	<td  width="3%">&nbsp;</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">��������ɱ�־</td>
	<td  width="4%">���̿ۿ�</td>
	<td  width="4%">���̿ۿ�����</td>
	<td  width="4%">�����׶�</td>
	<td  width="6%">���������</td>
	<td  width="6%">���������</td>
	<td  width="5%">�۹����</td>
	<td  width="5%">��������</td>
	<td  width="5%">�������ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="7%">������ԭ��</td>
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