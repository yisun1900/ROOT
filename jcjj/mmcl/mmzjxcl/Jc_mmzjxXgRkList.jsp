<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String jc_mmzjx_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_lxfs2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String cxhdbm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_mmzjx_khbh=request.getParameter("jc_mmzjx_khbh");
	if (jc_mmzjx_khbh!=null)
	{
		jc_mmzjx_khbh=cf.GB2Uni(jc_mmzjx_khbh);
		if (!(jc_mmzjx_khbh.equals("")))	wheresql+=" and  (jc_mmzjx.khbh='"+jc_mmzjx_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}


	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}

	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	
	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}

	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}



	String jc_mmzjx_yddbh=null;
	String jc_mmzjx_zjxxh=null;
	jc_mmzjx_yddbh=request.getParameter("jc_mmzjx_yddbh");
	if (jc_mmzjx_yddbh!=null)
	{
		jc_mmzjx_yddbh=cf.GB2Uni(jc_mmzjx_yddbh);
		if (!(jc_mmzjx_yddbh.equals("")))	wheresql+=" and  (jc_mmzjx.yddbh='"+jc_mmzjx_yddbh+"')";
	}
	jc_mmzjx_zjxxh=request.getParameter("jc_mmzjx_zjxxh");
	if (jc_mmzjx_zjxxh!=null)
	{
		jc_mmzjx_zjxxh=jc_mmzjx_zjxxh.trim();
		if (!(jc_mmzjx_zjxxh.equals("")))	wheresql+=" and (jc_mmzjx.zjxxh="+jc_mmzjx_zjxxh+") ";
	}

	String jc_mmzjx_mmzjxyybm=null;
	String jc_mmzjx_clzt=null;
	jc_mmzjx_mmzjxyybm=request.getParameter("jc_mmzjx_mmzjxyybm");
	if (jc_mmzjx_mmzjxyybm!=null)
	{
		jc_mmzjx_mmzjxyybm=cf.GB2Uni(jc_mmzjx_mmzjxyybm);
		if (!(jc_mmzjx_mmzjxyybm.equals("")))	wheresql+=" and  (jc_mmzjx.mmzjxyybm='"+jc_mmzjx_mmzjxyybm+"')";
	}
	jc_mmzjx_clzt=request.getParameter("jc_mmzjx_clzt");
	if (jc_mmzjx_clzt!=null)
	{
		jc_mmzjx_clzt=cf.GB2Uni(jc_mmzjx_clzt);
		if (!(jc_mmzjx_clzt.equals("")))	wheresql+=" and  (jc_mmzjx.clzt='"+jc_mmzjx_clzt+"')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_mmzjx.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_mmzjx.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_mmzjx.xmzy='"+xmzy+"')";
	}


	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_mmzjx.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_mmzjx.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_mmzjx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_mmzjx.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_mmzjx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_mmzjx.gys like '%"+gys2+"%')";
	}


	String zjxfssj=null;
	zjxfssj=request.getParameter("zjxfssj");
	if (zjxfssj!=null)
	{
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_mmzjx.zjxfssj>=TO_DATE('"+zjxfssj+"','YYYY-MM-DD'))";
	}
	zjxfssj=request.getParameter("zjxfssj2");
	if (zjxfssj!=null)
	{
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_mmzjx.zjxfssj<=TO_DATE('"+zjxfssj+"','YYYY-MM-DD'))";
	}
	String zjxqrsj=null;
	zjxqrsj=request.getParameter("zjxqrsj");
	if (zjxqrsj!=null)
	{
		if (!(zjxqrsj.equals("")))	wheresql+="  and (jc_mmzjx.zjxqrsj>=TO_DATE('"+zjxqrsj+"','YYYY-MM-DD'))";
	}
	zjxqrsj=request.getParameter("zjxqrsj2");
	if (zjxqrsj!=null)
	{
		if (!(zjxqrsj.equals("")))	wheresql+="  and (jc_mmzjx.zjxqrsj<=TO_DATE('"+zjxqrsj+"','YYYY-MM-DD'))";
	}


	String jc_mmzjx_srksj=null;
	jc_mmzjx_srksj=request.getParameter("jc_mmzjx_srksj");
	if (jc_mmzjx_srksj!=null)
	{
		jc_mmzjx_srksj=jc_mmzjx_srksj.trim();
		if (!(jc_mmzjx_srksj.equals("")))	wheresql+="  and (jc_mmzjx.srksj>=TO_DATE('"+jc_mmzjx_srksj+"','YYYY/MM/DD'))";
	}
	jc_mmzjx_srksj=request.getParameter("jc_mmzjx_srksj2");
	if (jc_mmzjx_srksj!=null)
	{
		jc_mmzjx_srksj=jc_mmzjx_srksj.trim();
		if (!(jc_mmzjx_srksj.equals("")))	wheresql+="  and (jc_mmzjx.srksj<=TO_DATE('"+jc_mmzjx_srksj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jc_mmzjx.zjxxh,DECODE(jc_mmzjx.clzt,'00','¼��δ���','01','¼�����','05','������ȷ��','02','�����ѽ���','03','�����','04','��װ���','99','�˵�'),jc_mmzjx.yddbh,pdgcmc,crm_khxx.khxm,crm_khxx.fwdz,jc_mmzjx.srksj,jc_mmzjx.rkr,jc_mmzjx.zjxqrsj,mmzjxyymc,jc_mmzjx.zjxze,jc_mmzjx.xmzy,jc_mmzjx.clgw,jc_mmzjx.ztjjgw,jc_mmzjx.khbh,crm_khxx.hth,crm_khxx.sjs,crm_khxx.zjxm,sgdmc ";
	ls_sql+=" FROM crm_khxx,jc_mmzjx,sq_sgd,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and jc_mmzjx.mmzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and jc_mmzjx.dwbh=sq_dwxx.dwbh(+)";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾������� 
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:�Ҿӹ���
		{
			ls_sql+=" and (jc_mmzjx.clgw='"+yhmc+"' OR jc_mmzjx.ztjjgw='"+yhmc+"' OR jc_mmzjx.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:�Ҿ����ʦ
		{
			ls_sql+=" and (jc_mmzjx.jjsjs='"+yhmc+"' OR jc_mmzjx.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:��ĿרԱ
		{
			ls_sql+=" and (jc_mmzjx.xmzy='"+yhmc+"' OR jc_mmzjx.lrr='"+yhmc+"')";
		}
	}

	ls_sql+=wheresql;
    ls_sql+=" order by jc_mmzjx.srksj desc";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmzjxXgRkList.jsp","","","XgRkJc_mmzjx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("���");

//���ð�ť����
	String[] buttonName={"ɾ�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteRkJc_mmzjx.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	if (yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"yddbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="/jcjj/mmdd/ViewGcJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("yddbh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
	}
	else{
		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"yddbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("yddbh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey1={"khbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey1;//�����в�����coluParm.key������
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("khxm",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
	}

	
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
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
  <B><font size="3">ľ����������޸����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">���������</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">Ԥ�������</td>
	<td  width="6%">�ɵ�����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="5%">ʵ���ʱ��</td>
	<td  width="4%">�����</td>
	<td  width="5%">������ȷ��ʱ��</td>
	<td  width="6%">������ԭ��</td>
	<td  width="5%">�������ܶ�</td>
	<td  width="4%">��ĿרԱ</td>
	<td  width="4%">פ��Ҿӹ���</td>
	<td  width="4%">չ���Ҿӹ���</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">�ʼ�</td>
	<td  width="4%">ʩ����</td>
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
