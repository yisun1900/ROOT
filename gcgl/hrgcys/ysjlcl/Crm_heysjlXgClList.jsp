<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	if (zwbm.equals("31"))//�������ܣ�ֻ�ܿ���С�鹤��
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
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



	String ysjlh=null;
	ysjlh=request.getParameter("ysjlh");
	if (ysjlh!=null)
	{
		ysjlh=cf.GB2Uni(ysjlh);
		if (!(ysjlh.equals("")))	wheresql+=" and  (crm_heysjl.ysjlh='"+ysjlh+"')";
	}

	String gcysxmbm=null;
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (crm_heysjl.gcysxmbm='"+gcysxmbm+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_heysjl.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_heysjl.zjxm='"+zjxm+"')";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_heysjl.sgd='"+sgd+"')";
	}

	String sgdmc=null;
	sgdmc=request.getParameter("sgdmc");
	if (sgdmc!=null)
	{
		sgdmc=cf.GB2Uni(sgdmc);
		if (!(sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sgdmc+"')";
	}


	String yssj=null;
	yssj=request.getParameter("yssj");
	if (yssj!=null)
	{
		yssj=cf.GB2Uni(yssj);
		if (!(yssj.equals("")))	wheresql+=" and  (crm_heysjl.yssj>=to_date('"+yssj+"','yyyy-mm-dd'))";
	}

	String yssj2=null;
	yssj2=request.getParameter("yssj2");
	if (yssj2!=null)
	{
		yssj2=cf.GB2Uni(yssj2);
		if (!(yssj2.equals("")))	wheresql+=" and  (crm_heysjl.yssj<=to_date('"+yssj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=cf.GB2Uni(lrsj);
		if (!(lrsj.equals("")))	wheresql+=" and  (crm_heysjl.lrsj>=to_date('"+lrsj+"','yyyy-mm-dd'))";
	}

	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		lrsj2=cf.GB2Uni(lrsj2);
		if (!(lrsj2.equals("")))	wheresql+=" and  (crm_heysjl.lrsj<=to_date('"+lrsj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String jssj=null;
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=cf.GB2Uni(jssj);
		if (!(jssj.equals("")))	wheresql+=" and  (crm_heysjl.jssj>=to_date('"+jssj+"','yyyy-mm-dd'))";
	}

	String jssj2=null;
	jssj2=request.getParameter("jssj2");
	if (jssj2!=null)
	{
		jssj2=cf.GB2Uni(jssj2);
		if (!(jssj2.equals("")))	wheresql+=" and  (crm_heysjl.jssj<=to_date('"+jssj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String jjsj=null;
	jjsj=request.getParameter("jjsj");
	if (jjsj!=null)
	{
		jjsj=cf.GB2Uni(jjsj);
		if (!(jjsj.equals("")))	wheresql+=" and  (crm_heysjl.jjsj>=to_date('"+jjsj+"','yyyy-mm-dd'))";
	}

	String jjsj2=null;
	jjsj2=request.getParameter("jjsj2");
	if (jjsj2!=null)
	{
		jjsj2=cf.GB2Uni(jjsj2);
		if (!(jjsj2.equals("")))	wheresql+=" and  (crm_heysjl.jjsj<=to_date('"+jjsj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String zgyssj=null;
	zgyssj=request.getParameter("zgyssj");
	if (zgyssj!=null)
	{
		zgyssj=cf.GB2Uni(zgyssj);
		if (!(zgyssj.equals("")))	wheresql+=" and  (crm_heysjl.zgyssj>=to_date('"+zgyssj+"','yyyy-mm-dd'))";
	}

	String zgyssj2=null;
	zgyssj2=request.getParameter("zgyssj2");
	if (zgyssj2!=null)
	{
		zgyssj2=cf.GB2Uni(zgyssj2);
		if (!(zgyssj2.equals("")))	wheresql+=" and  (crm_heysjl.zgyssj<=to_date('"+zgyssj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String ysr=null;
	ysr=request.getParameter("ysr");
	if (ysr!=null)
	{
		ysr=cf.GB2Uni(ysr);
		if (!(ysr.equals("")))	wheresql+=" and  (crm_heysjl.ysr like '%"+ysr+"%')";
	}

	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_heysjl.lrr like '%"+lrr+"%')";
	}

	String sjysjg=null;
	sjysjg=request.getParameter("sjysjg");
	if (sjysjg!=null)
	{
		sjysjg=cf.GB2Uni(sjysjg);
		if (!(sjysjg.equals("")))	wheresql+=" and  (crm_heysjl.sjysjg='"+sjysjg+"')";
	}
	String clbz=null;
	clbz=request.getParameter("clbz");
	if (clbz!=null)
	{
		clbz=cf.GB2Uni(clbz);
		if (!(clbz.equals("")))	wheresql+=" and  (crm_heysjl.clbz='"+clbz+"')";
	}
	String clbz1=null;
	clbz1=request.getParameter("clbz1");
	if (clbz1!=null)
	{
		clbz1=cf.GB2Uni(clbz1);
		if (clbz1.equals("Y"))
		{
			wheresql+=" and  (crm_heysjl.clbz='5')";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
		}
		else if (clbz1.equals("N"))
		{
			wheresql+=" and  (crm_heysjl.clbz not in('5','9','0'))";
		}
	}

	String zpsx=null;
	zpsx=request.getParameter("zpsx");
	if (zpsx!=null)
	{
		zpsx=cf.GB2Uni(zpsx);
		if (zpsx.equals("Y"))
		{
			wheresql+=" and  (crm_heysjl.zpsl>0)";
		}
		else if (zpsx.equals("N"))
		{
			wheresql+=" and  (crm_heysjl.zpsl=0)";
		}
	}


	ls_sql="SELECT crm_heysjl.ysjlh,DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','������') sjysjg,DECODE(crm_heysjl.clbz,'9','¼��δ���','0','û����','1','����δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') clbz,zpsl,dm_gcysxm.gcysxmmc,crm_heysjl.jjr,TO_CHAR(crm_heysjl.jjsj,'YYYY-MM-DD'),crm_khxx.khxm,crm_khxx.fwdz,crm_heysjl.sjs,sq_sgd.sgdmc,crm_heysjl.zjxm,crm_heysjl.ysr,TO_CHAR(crm_heysjl.yssj,'YYYY-MM-DD'),crm_heysjl.zgcljlh ,TO_CHAR(jhjjsj,'YYYY-MM-DD'),crm_heysjl.jsr,TO_CHAR(crm_heysjl.jssj,'YYYY-MM-DD'),crm_heysjl.jssm,DECODE(crm_heysjl.cljg,'3','�ڴ���','4','�ѽ��') cljg,crm_heysjl.jjsm,DECODE(crm_heysjl.zgysjg,'5','����ͨ��','6','����δͨ��') zgysjg,crm_heysjl.zgysr,TO_CHAR(crm_heysjl.zgyssj,'YYYY-MM-DD'),crm_heysjl.zgyssm             ,crm_khxx.khbh,crm_heysjl.lrr,crm_heysjl.lrsj,sq_dwxx.dwmc,crm_heysjl.yscsjlh,crm_heysjl.bz  ";
	ls_sql+=" FROM crm_heysjl,sq_dwxx,dm_gcysxm,crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_heysjl.lrbm=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_heysjl.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and crm_heysjl.gcysxmbm=dm_gcysxm.gcysxmbm(+) ";
    ls_sql+=" and crm_heysjl.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_heysjl.clbz in('3','4')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by crm_heysjl.jjsj desc,crm_heysjl.yscsjlh desc,crm_heysjl.ysjlh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_heysjlXgClList.jsp","","","XgClCrm_heysjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"zgcljlh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//	pageObj.setEditStr("����");

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteClCrm_heysjl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
*/

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
	String[] coluKey1={"ysjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/gcgl/hrgcys/ysjl/ViewCrm_heysjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">���Ĵ���ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(460);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">���ռ�¼��</td>
	<td  width="2%">��Ŀ���ս��</td>
	<td  width="2%">���Ĵ���״̬</td>
	<td  width="1%">��Ƭ����</td>
	<td  width="5%">������Ŀ</td>
	<td  width="50px">���Ĵ�����</td>
	<td  width="2%">���Ĵ���ʱ��</td>
	
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="50px">���ʦ</td>
	<td  width="50px">ʩ����</td>
	<td  width="50px">����</td>

	<td  width="50px">������</td>
	<td  width="2%">����ʱ��</td>
	<td  width="2%">���Ĵ����¼��</td>
	<td  width="2%">�ƻ����ʱ��</td>
	<td  width="50px">������</td>
	<td  width="2%">����ʱ��</td>
	<td  width="8%">����˵��</td>

	<td  width="2%">������</td>
	<td  width="12%">���Ĵ������</td>

	<td  width="2%">�������ս��</td>
	<td  width="50px">����������</td>
	<td  width="2%">��������ʱ��</td>
	<td  width="10%">��������˵��</td>

	<td  width="50px">�ͻ����</td>
	<td  width="50px%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="2%">���մ�����¼��</td>
	<td  width="10%">��ע</td>
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