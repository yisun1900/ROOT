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



	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=shbz.trim();
		if (!(shbz.equals("")))	wheresql+=" and (crm_zjxdj.shbz='"+shbz+"') ";
	}
	String sfwc=null;
	sfwc=request.getParameter("sfwc");
	if (sfwc!=null)
	{
		sfwc=sfwc.trim();
		if (!(sfwc.equals("")))	wheresql+=" and (crm_zjxdj.sfwc='"+sfwc+"') ";
	}
	String zjxxh=null;
	zjxxh=request.getParameter("zjxxh");
	if (zjxxh!=null)
	{
		zjxxh=zjxxh.trim();
		if (!(zjxxh.equals("")))	wheresql+=" and (crm_zjxdj.zjxxh='"+zjxxh+"') ";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zjxdj.lrr='"+lrr+"')";
	}
	String lrsj=null;
	String fssj=null;
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
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}


	String zjxfsjd=null;
	zjxfsjd=request.getParameter("zjxfsjd");
	if (zjxfsjd!=null)
	{
		if (!(zjxfsjd.equals("")))	wheresql+=" and  (crm_zjxdj.zjxfsjd='"+zjxfsjd+"')";
	}

	String khjsbz=null;
	khjsbz=request.getParameter("khjsbz");
	if (khjsbz!=null)
	{
		if (khjsbz.equals("1"))
		{
			wheresql+=" and  (crm_khxx.khjsbz in('N','3'))";
		}
		else if (khjsbz.equals("2"))
		{
			wheresql+=" and  (crm_khxx.khjsbz in('Y','2'))";
		}
	}


	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT  *";
	ls_sql+=" from ";
	ls_sql+=" ( ";
	ls_sql+=" SELECT  crm_zjxdj.zjxxh,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.khjsbz,'N','δ����','Y','����','2','����ͬ��','3','������ͬ��') khjsbz,sgdmc,sjs ,(SELECT sum(round(bj_zjxzcbgqd.xdsl*bj_zjxzcbgqd.jsj,2)) FROM bj_zjxzcbgqd where crm_zjxdj.zjxxh=bj_zjxzcbgqd.zjxxh and bj_zjxzcbgqd.tclx='1' and bj_zjxzcbgqd.tccpdlbm=3) zje,fssj,crm_zjxdj.lrr,crm_zjxdj.zjxyysm ,DECODE(crm_zjxdj.lx,'1','�˲���','2','����ϸ�˲���','3','�˲���','4','������Ʒ'),DECODE(crm_zjxdj.sfwc,'N','δ���','Y','�����','K','�ѿۿ�') ";
	ls_sql+=" FROM crm_zjxdj,crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_zjxdj.sfwc='Y'";//N��δ��ɣ�Y�������
	ls_sql+=" and crm_zjxdj.lx='3'";//1�����������2����������������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;

	ls_sql+=" ) ";

    ls_sql+=" where zje!=0";
    ls_sql+=" order by sgdmc,zje,fssj desc,zjxxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zjxdjCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"zjxxh","fylxbm","khbh","khxm","dh","sgd","dm_zjxyybm_zjxyymc","zjje","fwdz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"�ۿ�"};//��ť����ʾ����
	String[] buttonLink={"SaveCzkk.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/Bj_zjxzcbgqdCzZjxCxList.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�˲������</td>
	<td  width="5%">�ͻ����</td>
	<td  width="8%">����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="5%">�ͻ������־</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���ʦ</td>
	<td  width="9%">��ש�������</td>
	<td  width="7%">�˲�������ʱ��</td>
	<td  width="5%">¼����</td>
	<td  width="13%">�˲���ԭ��</td>
	<td  width="5%">����</td>
	<td  width="5%">״̬</td>
</tr>
<%
	pageObj.displayDateSum();
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